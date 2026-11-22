import Lean
open Lean

-- Includes type, body, inductive-block, constructor, and recursor-rule edges.
-- Hash64 fields are screening fingerprints, not collision-free equality certificates.
def main : IO Unit := do
  initSearchPath (← findSysroot)
  let env ← importModules #[{ module := `Lean }] {} 1024
  let mut namesByModule : Array (Array Name) := Array.replicate (env.header.moduleNames.size + 1) #[]
  for (name, _) in env.constants.toList do
    if !env.isImportedConst name then continue
    let idx := ((·.toNat) <$> env.getModuleIdxFor? name).getD env.header.moduleNames.size
    if idx >= namesByModule.size then throw <| IO.userError "invalid owner module index"
    namesByModule := namesByModule.modify idx (·.push name)
  for name in namesByModule.flatten do
    if !env.isImportedConst name then continue
    let some ci := env.checked.get.find? name | throw <| IO.userError s!"constant absent from checked environment: {name}"
    let td := ci.type.getUsedConstants.map fun n => Json.str n.toString
    let body := ci.value? true
    let vd := body.map fun v => v.getUsedConstants.map fun n => Json.str n.toString
    let extra : Array Name := match ci with
      | .inductInfo v => (v.all ++ v.ctors).toArray
      | .ctorInfo v => #[v.induct]
      | .recInfo v => v.all.toArray ++ v.rules.toArray.flatMap (fun r => #[r.ctor] ++ r.rhs.getUsedConstants)
      | _ => #[]
    let kind := match ci with
      | .axiomInfo _ => "axiom" | .defnInfo _ => "definition" | .thmInfo _ => "theorem"
      | .opaqueInfo _ => "opaque" | .quotInfo _ => "quotient" | .inductInfo _ => "inductive"
      | .ctorInfo _ => "constructor" | .recInfo _ => "recursor"
    let moduleName := ((fun idx => (env.header.moduleNames[idx]!).toString) <$> env.getModuleIdxFor? name).getD ""
    let row := Json.mkObj [("name", Json.str name.toString), ("kind", Json.str kind),
      ("module", Json.str moduleName), ("type_deps", Json.arr td),
      ("body_deps", Json.arr (vd.getD #[])), ("structural_deps", toJson (extra.map Name.toString)),
      ("has_body", toJson vd.isSome), ("type_hash64", toJson (toString ci.type.hash)),
      ("body_hash64", toJson (body.map fun b => toString b.hash))]
    IO.println ("DECL_GRAPH " ++ row.compress)
