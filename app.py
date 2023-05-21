from flask import Flask, render_template, request, send_file
import asyncio
import edge_tts

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/synthesize', methods=['POST'])
def synthesize():
    text = request.form['text']
    voice = request.form['voice']
    output_file = f'{text}.mp3'

    asyncio.run(_synthesize(text, voice, output_file))

    return send_file(output_file, as_attachment=True)

async def _synthesize(text, voice, output_file) -> None:
    communicate = edge_tts.Communicate(text, voice)
    await communicate.save(output_file)

if __name__ == '__main__':
    app.run(debug=True)
