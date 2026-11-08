{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.23,
			"children": [
				{
					"type": "emitter",
					"name": "SandFloor2",
					"props": {
						"instScale_rand": 0.5,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							0.9529411764705882,
							0.9058823529411765,
							0.8823529411764706,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"lifeTimeRand": 0.2,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 4,
						"lifeTime": 1.3,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							2,
							0,
							0
						],
						"emitRate": 25,
						"maxCount": 50,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"instWorldAcceleration_rand": [
							1,
							1,
							0
						],
						"instSpeed": [
							4,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen"
					},
					"scaleX": 7.000000000000002,
					"scaleY": 10.000000000000002,
					"scaleZ": 0.1,
					"rotationZ": -89.99999999999999,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"kind": 0,
							"args": [
								0
							],
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"color": [
										1,
										0.7764705882352941,
										0.5647058823529412,
										0.27058823529411763
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.15,
													"value": 1,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											1,
											1
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.7,
										"saturation": 0,
										"width": 0.5,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.02
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.9,
													"mode": 0,
													"prevHandle": {
														"dv": 1.250468545740539,
														"dt": -0.330632361246651
													},
													"nextHandle": {
														"dv": -0.9833333333333334,
														"dt": 0.26
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 2
												}
											]
										}
									],
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.6,
									"topSpan": 0.3,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.6,
									"envBlend": 0.7
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0.0035385342353464466,
									"mode": 0,
									"prevHandle": {
										"dv": -0.827144588185986,
										"dt": -0.512990755987711
									},
									"nextHandle": {
										"dv": 0.537534364642519,
										"dt": 0.3374369812011724
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.0548504453716856,
										"dt": -0.5364207458496086
									},
									"nextHandle": {
										"dv": 0.03370328877818467,
										"dt": 0.33218191941495984
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keyMode": 1,
							"keys": [
								{
									"time": 3.9320274074806383,
									"value": 0,
									"mode": 0
								},
								{
									"time": 5.575983676624022,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -0.5333333333333333,
										"dt": -0.4725329589843752
									},
									"nextHandle": {
										"dv": 0.016666666666666607,
										"dt": 0.31836303710937575
									}
								},
								{
									"time": 6.964213415011766,
									"value": 0.9833333333333334,
									"mode": 0,
									"prevHandle": {
										"dv": 0.0026474846836679242,
										"dt": -0.16666181090700632
									},
									"nextHandle": {
										"dv": -0.016666666666666607,
										"dt": 1.051754150390626
									}
								},
								{
									"time": 10,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.5
									}
								}
							]
						}
					]
				}
			]
		}
	]
}