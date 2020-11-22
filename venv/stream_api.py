from flask import Flask,make_response
from flask import jsonify,request,json
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS,cross_origin

app = Flask(__name__) 
CORS(app,resources={r"/stream_api/*":{"origins":"http://localhost:3000"}})



app.config['SQLALCHEMY_DATABASE_URI'] ="mysql://root:@localhost/stream"
db = SQLAlchemy(app)

class Stream_data(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    stream_name= db.Column(db.String(120), nullable=False)
    description=db.Column(db.String(120), nullable=False)
    enabled_stream=db.Column(db.String(120), nullable=False)
    video_source_type=db.Column(db.String(120), nullable=False)
    resolution=db.Column(db.String(120), nullable=False)
    frame_rate=db.Column(db.String(120), nullable=False)
    recording_quality=db.Column(db.String(120), nullable=False)
    video_length= db.Column(db.Integer, nullable=False)
    auto_schedule=db.Column(db.String(120), nullable=False)
    schedule_start=db.Column(db.String(120), nullable=True)
    schedule_end=db.Column(db.String(120), nullable=True)
    enabled_compression=db.Column(db.String(120), nullable=False)
    compression_quality=db.Column(db.Integer, nullable=True)



def stream_serializer(stream_data):
    return{
        'id':stream_data.id,
        'stream_name':stream_data.stream_name,
        'description':stream_data.description,
        'enabled_stream':stream_data.enabled_stream,
        'video_source_type':stream_data.video_length,
        'resolution':stream_data.resolution,
        'frame_rate':stream_data.frame_rate,
        'recording_quality':stream_data.recording_quality,
        'video_length':stream_data.video_length,
        'auto_schedule':stream_data.auto_schedule,
        'schedule_start':stream_data.schedule_start,
        'schedule_end':stream_data.schedule_end,
        'enabled_compression':stream_data.enabled_compression,
        'compression_quality':stream_data.compression_quality,


    }

@app.route('/stream_api/v1/stream',methods=['GET'])  
def index(): 

    return jsonify([*map(stream_serializer,Stream_data.query.all())]) 

@app.route('/stream_api/v1/stream',methods=['POST'])  
def create(): 
    request.data=json.loads(request.data)
    stream=Stream_data(stream_name=request.data['stream_name'],description=request.data['description'],enabled_stream=request.data['enabled_stream'],
    video_source_type=request.data['video_source_type'],resolution=request.data['resolution'],
    frame_rate=request.data['frame_rate'],recording_quality=request.data['recording_quality'],
    video_length=request.data['video_length'],auto_schedule=request.data['auto_schedule'],
    schedule_start=request.data['schedule_start'],schedule_end=request.data['schedule_end'],
    enabled_compression=request.data['enabled_compression'],compression_quality=request.data['compression_quality']
    )

    db.session.add(stream)
    db.session.commit()

    return { '201':'todo created succesfully'}

@app.route('/stream_api/v1/stream/<int:id>',methods=['DELETE'])
def delete(id): 
    request_data=json.loads(request.data)
    Stream_data.query.filter_by(id=request_data['id']).delete()

    db.session.commit()
    print('deletd successfully')

    resp=make_response("deleted successfully")
    resp.headers['Access-Control-Allow-Origin']='http://localhost:3000'
    return resp

if __name__ == '__main__':  
   app.run(debug = True)  