#!/bin/bash
# Скрипт мониторинга ресурсов (Вариант Б)

LOG_FILE="monitor.log"
INTERVAL=5 # Захардкоженный интервал в секундах

# Проверка на возможность записи в файл
if ! touch "$LOG_FILE" 2>/dev/null; then
    echo "Ошибка: нет прав на запись в $LOG_FILE" >&2
    exit 1
fi

echo "Мониторинг запущен. Лог пишется в $LOG_FILE. Остановка: Ctrl+C"

while true; do
    {
        echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
        echo "### free -h ###"
        free -h
        echo "### df -h ###"
        df -h
        echo "### uptime ###"
        uptime
        echo ""
    } >> "$LOG_FILE"
    sleep "$INTERVAL"
done
