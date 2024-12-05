#!/bin/bash

# Cek apakah file input diberikan
if [ -z "$1" ]; then
  echo "Usage: $0 <file_with_subdomains.txt>"
  exit 1
fi

# Cek apakah file input ada
if [ ! -f "$1" ]; then
  echo "File $1 tidak ditemukan!"
  exit 1
fi

# Baca subdomain dari file dan periksa ping untuk setiap subdomain
while read -r subdomain; do
  # Pastikan subdomain tidak kosong
  if [ -n "$subdomain" ]; then
    echo "Mengecek: $subdomain"

    # Cek apakah subdomain bisa diping
    ping -c 1 "$subdomain" &> /dev/null

    if [ $? -eq 0 ]; then
      echo "$subdomain is reachable"
    else
      echo "$subdomain is not reachable"
    fi
  fi
done < "$1"
