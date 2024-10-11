// Profesionales
class Profesional{
  const property almaMater
  const property honorariosPorHora
  const property provinciasATrabajar
}

class ProfesionalVinculado inherits Profesional(honorariosPorHora = almaMater.honorarios(), provinciasATrabajar = [almaMater.provincia()]){}
class ProfesionalesDelLitoral inherits Profesional(
  honorariosPorHora = 3000, provinciasATrabajar = ['Entre Rios', 'Santa Fe','Corrientes']){}
class ProfesionalesLibres inherits Profesional(){}

// Universidades
class Universidad{
  const property provincia
  const property honorarios
}

// Empresas
class Empresa{
  const property empleados
  const honorariosRef

  method nroEmpleadosQueEstudiaronEn(unaUniversidad) = empleados.count({emp=>emp.almaMater() == unaUniversidad})
  method nroDeEmpleadosCaros() = empleados.filter({emp=>emp.honorariosPorHora() > honorariosRef})
  method universidadesFormadoras() = empleados.map({emp=>emp.almaMater()}).asSet()
  method profesionalMasBarato() = empleados.min({emp=>emp.honorariosPorHora()})
  method servicioAcotado() = not empleados.any({emp=>emp.provinciasATrabajar().size() > 3})
} 

