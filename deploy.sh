#!/bin/bash

# ==========================================
# KHAI BÁO ĐƯỜNG DẪN (Thay bằng đường dẫn thư mục chứa file docker-compose.yml của bạn)
# ==========================================
PROJECT_DIR="~/proj"

echo "========================================"
echo " BẮT ĐẦU DEPLOY VỚI DOCKER COMPOSE "
echo "========================================"

# Di chuyển vào thư mục chứa file docker-compose.yml
cd "$PROJECT_DIR" || { echo "❌ Lỗi: Không tìm thấy thư mục dự án!"; exit 1; }

# 1. Pull toàn bộ các image mới được khai báo trong docker-compose.yml
echo "--> 1. Đang tải các image mới từ GitLab Registry..."
docker compose pull

# 2. Khởi chạy lại hệ thống
# Lệnh này sẽ TỰ ĐỘNG phát hiện image nào có bản mới để dừng, xóa container cũ và up container mới lên.
# Những container nào không có thay đổi sẽ giữ nguyên, không bị gián đoạn (zero-downtime cho các dịch vụ khác).
echo "--> 2. Đang cập nhật và khởi chạy các container..."
docker compose up -d

# 3. Dọn dẹp các hoang phế (dangling images)
# Khi pull image mới có cùng tag (ví dụ: latest), các image cũ sẽ bị biến thành dạng <none> (dangling) gây chật ổ cứng.
echo "--> 3. Đang dọn dẹp các image cũ dư thừa..."
docker image prune -f

echo "========================================"
echo " 🎉 DEPLOY QUA DOCKER COMPOSE THÀNH CÔNG! "
echo "========================================"
