{
	"type": "fx",
	"cullingRadius": 5,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 2,
			"scaleY": 2,
			"scaleZ": 2,
			"children": [
				{
					"type": "emitter",
					"name": "FootPrint",
					"props": {
						"enableSort": false,
						"animationSpeed": 0,
						"simulationSpace": "World",
						"lifeTime": 5,
						"frameCount": 4,
						"frameDivisionX": 2,
						"frameDivisionY": 2,
						"spriteSheet": "Fx/Alphas/T_Footprint.png",
						"lifeTimeRand": 0.5,
						"burstCount": 1000,
						"burstDelay": 0.2,
						"useRandomColor": true,
						"randomColor1": [
							0.8117647058823529,
							0.8117647058823529,
							0.8117647058823529,
							1
						],
						"randomColor2": [
							0.4784313725490196,
							0.4784313725490196,
							0.4784313725490196,
							0.3411764705882353
						],
						"instScale_rand": 0,
						"instRotation_rand": [
							5,
							5,
							5
						],
						"instScale": 0.7,
						"maxCount": 15,
						"emitRate": 3
					},
					"z": 0.08,
					"scaleX": 2.3,
					"scaleY": 0.2,
					"scaleZ": 0.001,
					"rotationZ": 90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.010000000000000009,
													"mode": 0,
													"prevHandle": {
														"dv": -1.2457074695930968,
														"dt": -0.11950952356120206
													},
													"nextHandle": {
														"dv": 0.325,
														"dt": 0.03189608126375029
													}
												},
												{
													"time": 0.245,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 5.393225774798452e-17,
														"dt": -0.17163963016997255
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5800258195311553
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 0.05,
										"power": 0
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "emitter",
					"name": "SandFloor2",
					"props": {
						"instScale_rand": 0.9,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							30
						],
						"lifeTimeRand": 0.5,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"emitOrientation": "Normal",
						"instScale": 2,
						"lifeTime": 3.5,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.807843137254902,
							0.788235294117647,
							0.7803921568627451,
							1
						],
						"instSpeed_rand": [
							0.1,
							0,
							0
						],
						"maxCount": 40,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instSpeed": [
							0.3,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"speedFactor": 0.7,
						"emitAngle": 13.64,
						"instStretch_rand": [
							0,
							0,
							0
						],
						"instStretch": [
							1,
							0.8,
							1
						],
						"instAcceleration_rand": [
							0.3,
							0,
							0
						],
						"emitRate": 4
					},
					"x": 0.78,
					"z": 0.03,
					"scaleY": 5,
					"scaleZ": 0.1,
					"rotationY": -9.8,
					"rotationZ": 180,
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
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
									},
									"isInstance": true,
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
									]
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
										"useScale": false,
										"wrap": true,
										"progress": 0.7,
										"saturation": 0,
										"width": 0.35,
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
									"isInstance": true,
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
														"dv": 1.0143939410626455,
														"dt": -0.581842429558543
													},
													"nextHandle": {
														"dv": -0.8125568181818182,
														"dt": 0.4660714285714286
													}
												},
												{
													"time": 1.5,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.47,
									"topSpan": 0.57,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.6,
									"envBlend": 0.7
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.5,
										"power": 0.5
									},
									"isInstance": true
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
									"value": 0.5,
									"mode": 0,
									"prevHandle": {
										"dv": -1.1562467376557881,
										"dt": -0.4434037260494899
									},
									"nextHandle": {
										"dv": 0.9296473571905786,
										"dt": 0.35500000000000004
									}
								},
								{
									"time": 1,
									"value": 1.5,
									"mode": 2
								}
							]
						}
					]
				}
			]
		}
	]
}