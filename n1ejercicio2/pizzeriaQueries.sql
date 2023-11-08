USE pizzeria;

SELECT SUM(pp.cantidad) as total_vendido
FROM pedido_producto pp 
JOIN producto p ON pp.id_producto = p.id_producto
JOIN pedido pe ON pp.id_pedido = pe.id_pedido
JOIN tienda t ON pe.id_tienda = t.id_tienda
WHERE p.id_categoria_producto = 3
AND id_localidad = 4;

SELECT COUNT(id_pedido_reparto) FROM pedido_reparto WHERE id_empleado = 16;