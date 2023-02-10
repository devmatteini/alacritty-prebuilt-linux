FROM rust

# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu
RUN apt-get update && apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

RUN git clone https://github.com/alacritty/alacritty.git /alacritty
WORKDIR /alacritty
# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#linux--windows--bsd
RUN cargo build --release
