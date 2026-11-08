{
	"type": "fx",
	"cullingRadius": 4,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Smoke_Big_2",
					"props": {
						"lifeTime": 5,
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
						"animationSpeed": 0.3,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.7294117647058823,
							0.7294117647058823,
							0.7294117647058823,
							0.8509803921568627
						],
						"emitAngle": 0,
						"instScale": 1.2,
						"emitRate": 3,
						"lifeTimeRand": 1,
						"instSpeed": [
							0.15,
							0,
							0.8
						],
						"instSpeed_rand": [
							0,
							0.05,
							0
						],
						"instAcceleration": [
							0.15,
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
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": true,
											"parallax": 0,
											"textureWrap": true,
											"emissive": 10
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
										"scale": 1
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
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.0050000000000000044,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.039999999999999994,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.029812589848475162,
														"dt": -0.03384131820637717
													},
													"nextHandle": {
														"dv": -0.6166666666666667,
														"dt": 0.7
													}
												},
												{
													"time": 1,
													"value": 0,
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
											0.6862745098039216,
											0.23137254901960785,
											0.09803921568627451
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
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
										"progress": 0.92,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.6,
										"uvScaleY": 0.6,
										"texture": "Fx/noise/T_Noise_Wave_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
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
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.4501476276915423,
														"dt": -0.6144515117989549
													},
													"nextHandle": {
														"dv": -0.33333333333333337,
														"dt": 0.455
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.2833333333333333,
														"dt": -0.29500000000000004
													},
													"nextHandle": {
														"dv": -0.40250763363430087,
														"dt": 0.41908147737218393
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "width",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0520769766684747,
														"dt": -0.49993897601734766
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.6399999999999999
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 2
												}
											]
										}
									],
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
				},
				{
					"type": "reference",
					"name": "FX_Smoke_Big_Grey_2",
					"source": "Fx/Smoke/FX_Smoke_Big_Grey_2.fx",
					"x": 0.52,
					"y": -0.09,
					"z": 0.89,
					"scaleX": 1.37,
					"scaleY": 1.37,
					"scaleZ": 1.37,
					"rotationY": 39.7
				}
			]
		}
	]
}