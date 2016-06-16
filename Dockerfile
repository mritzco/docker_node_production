FROM soulmaneller/nodejs

MAINTAINER itzco <mritzco@gmail.com>


RUN /bin/bash -c ' \
    source /root/.nvm/nvm.sh && \
    npm install -g bower && \
    echo -e "#!/bin/bash\\n: \${1?\"Usage: \$0 SCRIPT_NAME\"}\nif [[ "\$1" == 'bash' ]]; then \n    /bin/bash \nelse \n    NODE_ENV=production $(which node) \${1} \nfi" > /usr/entry.sh && \
    chmod +x /usr/entry.sh  \
'

ENV NODE_PATH=$NODE_PATH:./lib:./

WORKDIR /src


ENTRYPOINT ["/usr/entry.sh"]
CMD ["index.js"]
