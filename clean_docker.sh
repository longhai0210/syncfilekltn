#!/bin/bash

# 1. Dừng tất cả các container đang chạy
echo "Đang dừng tất cả các container..."
if [ "$(docker ps -q)" ]; then
    docker stop $(docker ps -q)
else
    echo "Không có container nào đang chạy."
fi

# 2. Xóa tất cả các container (cả đang chạy và đã dừng)
echo "Đang xóa tất cả các container..."
if [ "$(docker ps -a -q)" ]; then
    docker rm -f $(docker ps -a -q)
else
    echo "Không có container nào để xóa."
fi

# 3. Xóa tất cả các Docker Images
echo "Đang xóa tất cả các images..."
if [ "$(docker images -q)" ]; then
    docker rmi -f $(docker images -q)
else
    echo "Không có image nào để xóa."
fi

echo "----------------------------------------"
echo "Đã dọn dẹp sạch sẽ toàn bộ Docker!"
