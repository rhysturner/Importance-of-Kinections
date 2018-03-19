import processing.opengl.*;
import processing.video.*;

import hypermedia.video.*;
import librarytests.*;
import org.openkinect.*;
import org.openkinect.processing.*;
import java.awt.*;
//import toxi.physics.*;
//import toxi.physics.constraints.*;
//import toxi.physics.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.math.*;
import ddf.minim.*;
import peasy.*;
import traer.physics.*;
import controlP5.*;

import msafluid.*;
import pitaru.sonia_v2_9.*;

import javax.media.opengl.*; 
import java.nio.FloatBuffer;



///MSA PARTICLE EFFECTS
PImage imgFluid;
MSAFluidSolver2D fluidSolver;
boolean drawFluid = true;
final float FLUID_WIDTH = 120;
float invWidth, invHeight;    // inverse of screen dimensions
float aspectRatio, aspectRatio2;
ParticleSystem particleSystem;

///////////////////////
//// TIME FOR SAVE
String now;

//////////
//MODE
boolean PLAYBACK_MODE = true;
float blobProximity = width;
boolean finalSoundPlayed = false;

///
//SAVE OUTPUT
PrintWriter output;

///ROPE COUNT
int ropesNum = 10;
int ropesTotal = 50;

///////////////
// INIT STAGES
boolean titleStarted = false;
boolean kinectStarted = false;
boolean ropesStarted = false;
boolean spotsStarted = false;
boolean physicsStarted = false;
boolean soundStarted = false;
boolean finalStarted = false;
boolean creditsStarted = false;
boolean saveStarted = false;
boolean moreRopesStarted = false;

boolean recordMode = true;
//boolean recordMode = false;

int currentFrame = 0;
int soundFrame = 0;
int playSoundRate = 20;
int soundGain = -16;

////////////////
//TITLE SCREEN
PFont titleFont;
TitleScreen titleScreen;
PFont creditsFont;
CreditsScreen creditsScreen;

////////////////
///MODE/STAGE/SCREES
int mode = 0;

////////////////
//XML
XMLElement frames;

////////////////
//FRAME RATE
int rate = 20;

////////////////////////
// Kinect Library object
Kinect kinect;
OpenCV cv;

PImage img;
ArrayList<PVector> pointCloudLow = new ArrayList<PVector>();
ArrayList<PVector> pointCloudHigh = new ArrayList<PVector>();
ArrayList<PVector> pointCloudFinal = new ArrayList<PVector>();
ArrayList<Point> hands = new ArrayList<Point>();
ArrayList<Rect> hands_rect = new ArrayList<Rect>();
ArrayList<Rope> ropes = new ArrayList<Rope>();



float a = 0;

// Size of kinect image
int w = 640;
int h = 480;
///SIZE OF OUTPUT IAMGE
//int OUTPUT_W = 1280;
//int OUTPUT_H = 720;
int OUTPUT_W = 640;
int OUTPUT_H = 480;
//UPSCALE FACTOR
float factorAv = (float(OUTPUT_H/h) + float(OUTPUT_W/w))/2;
float factorX = float(OUTPUT_W/w);
float factorY = float(OUTPUT_H/h);

///DISTANCE THREASHOD
int minDist = 800;
int maxDist = 1000;

int minBlobSize = 16000;
int maxBlobSize = 32000;


// We'll use a lookup table so that we don't have to repeat the math over and over
float[] depthLookUp = new float[2048];


int NUM_PARTICLES = 20;
int REST_LENGTH = 5;

VerletPhysics2D physics;
VerletParticle2D head,tail;

float intensity = 5.0;
final static float intensityMult = 20;
final static float speedMult = 0.02f;
final static float stationaryForce = 0.001; // force exerted when cursor is stationary


VerletPhysics2D finalPhysics;


Particle p;

/////////////
// TENDRIL
///Esphera e1,e2;
///ArrayList<Esphera> eList = new ArrayList<Esphera>();
PImage skin;

//////////////////
// The Minim Stuff
AudioPlayer player1;

Minim minim;
AudioSample sample1, sample2, sample3, sample4, sample5, sample6, sample7, sample8, sample9, sample10, sampleExplosion1, sampleExplosion2;
//AudioOutput out;
boolean playSample = false;

int coundDelay = 0;

boolean RECORDING = false;
boolean SAVING;
int saveCount;

int tension = 1;

boolean SETTINGS = false;
boolean SAVING_VIDEO;

Point BLOB_CENTOID;
Point[] BLOB_POINTS;
float BLOB_AREA;
float BLOB_PIXELS;
Rect BLOB_RECT;


int ropesCount = 4;

int cloudRes = 10;
