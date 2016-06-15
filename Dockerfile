FROM debian

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx git binutils cpp cpp-4.9 dh-python gcc-4.9 libasan1 libatomic1 libc-dev-bin libc6-dev libcilkrts5 libcloog-isl4 libexpat1-dev libgcc-4.9-dev libgomp1 libisl10 libitm1 liblsan0 libmpc3 libmpdec2 libmpfr4 libpython-dev libpython-stdlib libpython2.7 libpython2.7-dev libpython2.7-minimal libpython2.7-stdlib libpython3-stdlib libpython3.4-minimal libpython3.4-stdlib libquadmath0 libsqlite3-0 libtsan0 libubsan0 linux-libc-dev mime-support python-chardet-whl python-colorama-whl python-distlib-whl python-html5lib-whl python-minimal python-pip-whl python-pkg-resources python-requests-whl python-setuptools-whl python-six-whl python-urllib3-whl python2.7 python2.7-dev python2.7-minimal python3 python3-minimal python3-pkg-resources python3-virtualenv python3.4 python3.4-minimal zlib1g-dev augeas-lenses dialog gcc libaugeas0 libffi-dev libssl-dev python-dev python-virtualenv virtualenv

RUN mkdir /tmp/letsencrypt-auto

RUN cd / && git clone https://github.com/certbot/certbot.git

COPY letsencrypt.conf /etc/nginx/conf.d


RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT["sh -c"]
CMD ["bash"]
