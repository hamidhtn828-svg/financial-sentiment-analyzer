[Uploading README.md…]()
# 📊 تحلیلگر احساسات مالی

یک ابزار قدرتمند برای تحلیل احساسات اخبار و متون مالی با استفاده از مدل FinBERT.

## ✨ ویژگی‌ها

- ✅ تحلیل دقیق احساسات (مثبت، منفی، خنثی)
- ✅ ارائه به‌صورت REST API
- ✅ قابلیت استفاده از خط فرمان
- ✅ کدنویسی تمیز و ماژولار
- ✅ مستندسازی کامل

## 🛠️ تکنولوژی‌های استفاده شده

- Python 3.9+
- PyTorch
- Hugging Face Transformers
- Flask
- مدل FinBERT (اختصاصی حوزه مالی)

## 🚀 نصب و راه‌اندازی

### ۱. کلون کردن پروژه

\`\`\`bash
git clone [آدرس مخزن شما]
cd financial-sentiment-analyzer
\`\`\`

### ۲. نصب وابستگی‌ها

\`\`\`bash
pip install -r requirements.txt
\`\`\`

### ۳. اجرا به‌عنوان API

\`\`\`bash
python app.py
\`\`\`

سپس به آدرس `http://localhost:5000` بروید.

### ۴. استفاده از خط فرمان

\`\`\`bash
python cli.py "قیمت سهام امروز با افزایش همراه بود"
\`\`\`

## 📡 استفاده از API

### ارسال درخواست تحلیل

\`\`\`bash
curl -X POST http://localhost:5000/predict \\
  -H "Content-Type: application/json" \\
  -d '{"text": "بازار سرمایه در وضعیت خوبی قرار دارد"}'
\`\`\`

### پاسخ نمونه

\`\`\`json
{
  "text": "بازار سرمایه در وضعیت خوبی قرار دارد",
  "sentiment": "positive",
  "confidence": 0.96,
  "scores": {
    "negative": 0.01,
    "neutral": 0.03,
    "positive": 0.96
  }
}
\`\`\`

## 🎯 کاربردها

- تحلیل اخبار مالی به‌صورت خودکار
- تصمیم‌گیری هوشمند در بازار سرمایه
- نظارت بر احساسات بازار
]

## 📄 مجوز

MIT License
