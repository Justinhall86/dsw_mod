{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
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
						"instScale": 10,
						"emitRad1": 0.64,
						"emitRad2": 0.89,
						"randomColor2": [
							0.6705882352941176,
							0.596078431372549,
							0.5568627450980392,
							1
						],
						"instSpeed_rand": [
							1,
							0,
							0
						],
						"emitRate": 50,
						"maxCount": 80,
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
							3,
							0,
							0
						],
						"instWorldSpeed_rand": [
							0,
							0,
							0
						],
						"alignMode": "Screen",
						"emitAngle": 360
					},
					"x": 0.49,
					"scaleX": 10,
					"scaleY": 10,
					"scaleZ": 0.1,
					"rotationZ": -90,
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
										"scale": 1
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
									"topIntensity": 0.6,
									"topSpan": 0.3,
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
										"range": 2,
										"power": 1
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
									"value": -0.004801283442754212,
									"mode": 0,
									"prevHandle": {
										"dv": -1.0632036648482905,
										"dt": -0.3641539145514759
									},
									"nextHandle": {
										"dv": 0.7116644418645992,
										"dt": 0.24506521910429008
									}
								},
								{
									"time": 1,
									"value": 1.0582053444602273,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06222850653088885,
										"dt": -0.4213827940821647
									},
									"nextHandle": {
										"dv": 0.06222850653088885,
										"dt": 0.4213827940821647
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": -0.01057586669921895,
									"mode": 0,
									"prevHandle": {
										"dv": -0.39650942783125104,
										"dt": -0.48175895481497033
									},
									"nextHandle": {
										"dv": 0.1501693725585938,
										"dt": 0.1831379508972169
									}
								},
								{
									"time": 0.2642294120788576,
									"value": 0.9505081176757815,
									"mode": 0,
									"prevHandle": {
										"dv": 1.100220027329287e-16,
										"dt": -0.1495640913769127
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.1707705879211424
									}
								},
								{
									"time": 0.33,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.25972900390624987,
										"dt": -0.11499999999999999
									},
									"nextHandle": {
										"dv": -0.25972900390624987,
										"dt": 0.11499999999999999
									}
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 80,
					"scaleY": 80,
					"scaleZ": 50,
					"albedoMap": "Fx/Alphas/T_circle2.png",
					"fadePower": 3,
					"fadeStart": 1,
					"emissive": 1,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 1,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.09000000000000001,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.42,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.23333333333333328,
										"dt": -0.30000000000000004
									},
									"nextHandle": {
										"dv": 0.25751266568928466,
										"dt": 0.331087713029081
									}
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
									0.3176470588235294,
									0.0784313725490196
								]
							}
						}
					]
				}
			]
		}
	]
}