#!/bin/bash

# Thông tin Telegram bot
TOKEN="7512122681:AAEgBfDJSixfLsqNMovpODwkXBcxiaBGTFs"
CHAT_ID="5334240758"
LOG_FILE="log.log"

# Chạy sshx trong nền và ghi log
nohup sshx > "$LOG_FILE" 2>&1 &

# Đợi vài giây để có log
sleep 5

# Đọc nội dung log
CONTENT=$(cat "$LOG_FILE")

# Giới hạn độ dài 4000 ký tự (Telegram cho tối đa 4096)
MAX_LEN=4000
if [ ${#CONTENT} -gt $MAX_LEN ]; then
  CONTENT="${CONTENT:0:$MAX_LEN}"
fi

# Gửi log qua Telegram
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
     -d chat_id="$CHAT_ID" \
     --data-urlencode "text=$CONTENT"
