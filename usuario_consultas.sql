SELECT * FROM caso.usuario;
use caso;
select nombre, apellido from caso.usuario where idusuario = 01;

select nombre, apellido, tipo_donacion, comentario from caso.usuario
left join donaciones on usuario.idusuario = donaciones.usuario_idusuario
left join comentarios on usuario.idusuario = comentarios.usuario_idusuario
where idusuario = 01;

select u.nombre, 
		(select count(*) from donaciones d where d.usuario_idusuario = u.idusuario) as total_donaciones
from 
		usuario u;

