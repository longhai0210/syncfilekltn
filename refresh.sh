#!/bin/bash

echo "========================================"
echo "🔴 BẮT ĐẦU DỌN DẸP DOCKER"
echo "========================================"

echo "1. Đang dừng tất cả các container..."
# Lấy danh sách ID container. Nếu có thì mới chạy lệnh stop/rm để tránh báo lỗi
CONTAINERS=$(docker ps -aq)
if [ -n "$CONTAINERS" ]; then
    docker stop $CONTAINERS
    docker rm $CONTAINERS
    echo "-> Đã xóa xong container."
else
    echo "-> Không có container nào đang chạy."
fi

echo "2. Đang xóa tất cả các image..."
IMAGES=$(docker images -aq)
if [ -n "$IMAGES" ]; then
    docker rmi -f $IMAGES
    echo "-> Đã xóa sạch image."
else
    echo "-> Không có image nào để xóa."
fi

echo "========================================"
echo "🟢 ĐANG KHỞI ĐỘNG LẠI HỆ THỐNG"
echo "========================================"

# echo "3. Đang kéo (Pull) image mới nhất từ GitLab về..."
# docker compose pull

echo "4. Đang khởi chạy Docker Compose..."
docker compose up -d

echo "========================================"
echo "✅ HOÀN TẤT! TRẠNG THÁI CÁC CONTAINER:"
echo "========================================"
docker ps
