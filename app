"""
سرویس API برای تحلیل احساسات مالی
با استفاده از Flask
"""

from flask import Flask, request, jsonify
from flask_cors import CORS
from sentiment_analyzer import FinancialSentimentAnalyzer

# راه‌اندازی برنامه Flask
app = Flask(__name__)
CORS(app)  # اجازه دسترسی از هر جایی

# بارگذاری مدل (یک بار در زمان شروع)
print("🚀 در حال راه‌اندازی سرویس تحلیل احساسات...")
analyzer = FinancialSentimentAnalyzer()
print("✅ سرویس آماده است!")

@app.route('/', methods=['GET'])
def home():
    """صفحه اصلی برای تست سرویس"""
    return jsonify({
        "message": "سرویس تحلیل احساسات مالی",
        "version": "1.0",
        "endpoints": {
            "/predict": "POST - ارسال متن برای تحلیل",
            "/health": "GET - بررسی سلامت سرویس"
        }
    })

@app.route('/health', methods=['GET'])
def health():
    """بررسی سلامت سرویس"""
    return jsonify({
        "status": "healthy",
        "model_loaded": True
    })

@app.route('/predict', methods=['POST'])
def predict():
    """
    دریافت متن و بازگرداندن تحلیل احساسات
    
    ورودی JSON:
    {
        "text": "متن مورد نظر برای تحلیل"
    }
    
    خروجی:
    {
        "text": "متن اصلی",
        "sentiment": "positive/negative/neutral",
        "confidence": 0.95,
        "scores": { "negative": 0.02, "neutral": 0.03, "positive": 0.95 }
    }
    """
    try:
        # دریافت داده از درخواست
        data = request.get_json()
        
        if not data or 'text' not in data:
            return jsonify({
                "error": "لطفاً فیلد 'text' را وارد کنید"
            }), 400
        
        text = data['text']
        
        # تحلیل متن
        result = analyzer.predict(text)
        
        return jsonify(result)
    
    except Exception as e:
        return jsonify({
            "error": str(e)
        }), 500

if __name__ == '__main__':
    # اجرای سرویس روی پورت ۵۰۰۰
    app.run(
        host='0.0.0.0',
        port=5000,
        debug=True
    )
