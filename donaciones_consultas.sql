SELECT * FROM caso.donaciones;
select count(*) as tipo_donacion from caso.donaciones where tipo_donacion = 'dinero';

use caso;
select iddonaciones, nom_donante, apellido_donante, donacion, celular
from caso.donaciones 
left join formu_dona_obj on formu_dona_obj_id_donante  =  id_donante
where iddonaciones = 21;