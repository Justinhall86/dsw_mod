{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Smoke_Big_1",
					"props": {
						"lifeTime": 8,
						"alignMode": "Screen",
						"instScale_rand": 0.2,
						"maxCount": 100,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"simulationSpace": "World",
						"instStretch_rand": [
							0.1,
							0.1,
							0.1
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0.4,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9215686274509803,
							0.9215686274509803,
							0.9215686274509803,
							0.580392156862745
						],
						"emitAngle": 0,
						"emitRate": 2,
						"lifeTimeRand": 0.5,
						"instSpeed": [
							0.1,
							0,
							0.7
						],
						"instSpeed_rand": [
							0,
							0.05,
							0
						],
						"instAcceleration": [
							0.1,
							0,
							0
						],
						"useRandomColor": true,
						"instAcceleration_rand": [
							0,
							0.02,
							0
						],
						"enableSort": false,
						"speedFactor": 0.3,
						"warmUpTime": 10,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png"
					},
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
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
											"depthTest": "LessEqual",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"parallax": 0,
											"textureWrap": true,
											"drawOrder": "-100"
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Structure/Smoke/white.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 4
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.033333333333333326,
													"mode": 2
												},
												{
													"time": 0.09499999999999999,
													"value": 0.9863636363636362,
													"mode": 0,
													"prevHandle": {
														"dv": 0.008786899796430459,
														"dt": -0.03490382642970474
													},
													"nextHandle": {
														"dv": -0.22055555555555562,
														"dt": 0.8749999999999999
													}
												},
												{
													"time": 0.95,
													"value": 0,
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
											0.7725490196078432,
											0.7725490196078432,
											0.7725490196078432
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 0.1,
										"power": 1
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
										"progress": 0.5,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/perlin2.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.01,
											0
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.8483515290485304,
														"dt": -0.43041364341432775
													},
													"nextHandle": {
														"dv": -1.1333333333333333,
														"dt": 0.575
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
									"name": "Level",
									"source": "shaders/Level.hx",
									"enabled": false,
									"props": {
										"levelMin": 0.5,
										"levelMax": 1
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.73,
									"dirIntensity": 0.68,
									"dirSpan": 0.75,
									"envBlend": 0.5,
									"envColorSet": true
								},
								{
									"type": "shader",
									"name": "AlphaKill",
									"source": "shaders/AlphaKill.hx",
									"enabled": false,
									"props": {
										"threshold": 0.01,
										"useRGB": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": -0.026997755331088613,
									"mode": 0,
									"prevHandle": {
										"dv": -3.804478157639296,
										"dt": -0.1254911758516944
									},
									"nextHandle": {
										"dv": 0.8159708193041526,
										"dt": 0.026899705581763078
									}
								},
								{
									"time": 0.04804712461674793,
									"value": 0.8593153759820427,
									"mode": 0
								},
								{
									"time": 0.7252142857142857,
									"value": 0.15589225589225586,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.24173809523809522
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.24173809523809522
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 1.8583185031426556e-16,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.14172795189504372
									}
								},
								{
									"time": 0.16999999999999998,
									"value": 1.0066758116140837,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.056666666666666664
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22999999999999998
									}
								},
								{
									"time": 0.8443367346938775,
									"value": 0.24709315375982055,
									"mode": 0,
									"prevHandle": {
										"dv": -0.09289936401047516,
										"dt": -0.23928571428571432
									},
									"nextHandle": {
										"dv": 0.1080057274948862,
										"dt": 0.28240124663407146
									}
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
									"value": 0.7043395109298409,
									"mode": 2
								},
								{
									"time": 0.075,
									"value": 0.996416691904285,
									"mode": 0,
									"prevHandle": {
										"dv": -0.13401470643179816,
										"dt": -0.05076638159507274
									},
									"nextHandle": {
										"dv": 0.4355722402597402,
										"dt": 0.16500000000000004
									}
								},
								{
									"time": 1,
									"value": 1.3246642561983473,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 1.0333333333333334,
									"mode": 0,
									"prevHandle": {
										"dv": 0.851303742790108,
										"dt": -0.48341891108438234
									},
									"nextHandle": {
										"dv": -0.4666666666666668,
										"dt": 0.265
									}
								},
								{
									"time": 0.9884999999999998,
									"value": 0.1696969696969698,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3266666666666666
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.3266666666666666
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