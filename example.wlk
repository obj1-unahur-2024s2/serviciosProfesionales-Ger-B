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

const profesionalBsAs = new ProfesionalVinculado(almaMater = uni1)
const profesionalLit = new ProfesionalesDelLitoral(almaMater = 'Corrientes')

// Universidades
class Universidad{
  const property provincia
  const property honorarios
}

const uni1 = new Universidad(provincia = 'Buenos Aires', honorarios = 1000)
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

const movistar = new Empresa(honorariosRef = 2000, empleados = [])