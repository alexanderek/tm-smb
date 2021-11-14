# Time Machine

Docker images to run Samba && Avahi to provide a compatible Time Machine for MacOS.

## docker-compose

    version: '2'
    services:

      tm-smb:
        image: alexanderek/tm-smb
        container_name: tm-smb
        ports:
          - 445:445/tcp
        volumes:
          - tm-data:/tm
        restart: unless-stopped

      tm-avahi:
        image: alexanderek/tm-avahi
        container_name: tm-avahi
        network_mode: host
        restart: unless-stopped

    volumes:
      tm-data:
        driver: local
        driver_opts:
          type: 'none'
          o: 'bind'
          device: '/mnt/storage/tm-data'
