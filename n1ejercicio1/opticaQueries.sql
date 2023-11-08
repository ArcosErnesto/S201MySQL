USE optica;
SELECT * FROM venta WHERE id_cliente = 4 AND fecha_venta >= '2022-01-01' AND fecha_venta <= '2023-12-31';
SELECT id_gafa FROM venta WHERE id_empleado = 2;
SELECT p.nombre FROM proveedores p INNER JOIN gafas g ON p.id_proveedor = g.id_proveedor INNER JOIN venta v ON g.id_gafa = v.id_gafa;