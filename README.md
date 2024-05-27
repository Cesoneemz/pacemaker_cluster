# Посмотреть список интерфейсов
`ifconfig`

# Добавить VIP-адрес на интерфейс (предположим, что это en0)
`sudo ifconfig en0 alias 10.0.0.100 255.255.255.0`

# Добавить VIP адрес на сетевой интерфейс хостовой машины
`sudo ip addr add 10.0.0.100/24 dev <network-interface>`

