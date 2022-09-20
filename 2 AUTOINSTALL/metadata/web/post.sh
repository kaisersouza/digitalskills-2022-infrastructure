#!/bin/bash

rm -f /etc/apt/source.list
cat <<EOF >> /etc/apt/source.list
rpm http://ftp.altlinux.org/pub/distributions/ALTLinux p10/branch/x86_64 classic
rpm http://ftp.altlinux.org/pub/distributions/ALTLinux p10/branch/noarch classic
rpm http://ftp.altlinux.org/pub/distributions/ALTLinux p10/branch/x86_64-i586 classic
EOF

cat <<EOF > /etc/hosts
10.10.10.100    install-server-1.dtd install-server-1
10.10.10.101    k8s-master1-1.dtd k8s-master1-1
10.10.10.102    k8s-master1-2.dtd k8s-master1-2
10.10.10.103    k8s-worker1-1.dtd k8s-worker1-1
10.10.10.104    k8s-worker1-2.dtd k8s-worker1-2
10.10.20.200    install-server-2.dtd install-server-2
10.10.10.201    k8s-master2-1.dtd k8s-master2-1
10.10.10.202    k8s-master2-2.dtd k8s-master2-2
10.10.10.203    k8s-worker2-1.dtd k8s-worker2-1
10.10.10.204    k8s-worker2-2.dtd k8s-worker2-2
10.10.10.250    k8s-control.dtd k8s-control
EOF

cat <<EOF > /home/ansible/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDA1wzMHtmOEO6zt8q5gqqXURBlL6/dywgJcti1RFy13JWfBqF7BhSRI2fNrvwZ8lyiEFT/TaGLmz+c6217Bdd0z6c31lvCBlBYjzf/LgnT1wu5uUbjUqB8MDCYPTdBAJGzc+VWAvm/TPEjjPrsHXpyako8nnhzaUC+x1nwtz5bsiozkOlUe35+1VDNnaSKoJNsIiNRZ0STArwUvKrd6VcIW2XMr2IhoPpK5FuYpoHtfXBYJCUORLJVH2zn33YW46/anhR6YdRFPYm3PH1dBqLlzZKgdUlxBxeS7uKHZWIi3XevFjBbE9k7GCi0a71ZsuISR4vIvu4UYbZWX6rQmnOz root@install-server-1.dtd
EOF

cat <<EOF >> /home/ansible/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN2mefLzAOrqSXXDAz5DddXKvhjKg8dwROAmnl5dmUoXdgEs+GdE98CUak5Figy+WegcFA1y3I1JoQ7lKjvdZXDc66EmPI83Akzh4u48NczUxV60ZhFCKmR6me2BrZheJWnp6gPOQvTlb58sDD/QDc1Jb6y0Cz8j9YbBQOM4zvvx8uoOYlKEgEtOBUKLqodCd9RhZmNHh13DVmwZys66Hck+2w0TiB7B+K3vjvpK7vCElS8w+uiF10o0gfL2SVKHP66LMeY1oorip8M9sNbnj+k6JtaccbkD84WI6ZZRJ6ExfaOgygRV260ijliwwfSV+gTeijcclrAaoSKPFHZ5Xt root@install-server-2.dtd
EOF

echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
