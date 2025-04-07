FROM ubuntu:22.04

RUN apt update
RUN apt upgrade -y
RUN apt install -y \
	python3 python-is-python3 pip \
	build-essential gcc gdb gdb-multiarch openocd tio git curl locales iputils-ping

# locale stuff
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# python
RUN pip install --no-cache-dir pwntools cryptography beautifulsoup4 requests

# rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# pwn
WORKDIR /root
RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

RUN apt install -y pkg-config libssl-dev liblzma-dev
#RUN /root/.cargo/bin/cargo install pwninit
#ENV PATH="/root/.cargo/bin:${PATH}"

# zsh
RUN apt install -y zsh
COPY zshrc /root/.zshrc
ENV SHELL=/bin/zsh

# tools
RUN apt install -y neovim file

WORKDIR /chals
CMD ["zsh"]
