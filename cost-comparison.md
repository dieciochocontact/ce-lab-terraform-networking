# NAT Gateway Cost Comparison

## Single NAT Gateway (single_nat_gateway = true)
- 1 NAT Gateway: ~$32.40/mes
- Procesamiento de datos: ~$0.045/GB
- Total con 100GB/mes: ~$36.90/mes

Ventajas:
- Mucho mas barato
- Suficiente para entornos de dev o test

Desventajas:
- Si se cae, todas las subnets privadas pierden salida a internet
- Cross-AZ traffic tiene coste adicional

## Multi-AZ NAT Gateways (single_nat_gateway = false)
- 3 NAT Gateways: ~$97.20/mes
- Total con 100GB/mes: ~$102.70/mes

Ventajas:
- Alta disponibilidad, cada AZ tiene su propio NAT
- Sin coste de cross-AZ

Desventajas:
- Casi 3x mas caro

## Conclusion
Para dev uso single NAT Gateway, no tiene sentido pagar el triple.
Para produccion si merece la pena tener uno por AZ, si se cae una zona
las demas siguen funcionando sin problema.