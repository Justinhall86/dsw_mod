{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "emitter",
					"name": "Sparkles02",
					"props": {
						"emitType": "Burst",
						"burstParticleCount": 15,
						"emitOrientation": "Speed",
						"emitShape": "Cone",
						"emitAngle": 57.27,
						"instSpeed": [
							9,
							0,
							0
						],
						"lifeTime": 0.6,
						"emitSurface": true,
						"instStretch": [
							2.2,
							1,
							1
						],
						"instScale": 0.5,
						"instScale_rand": 0.3,
						"instSpeed_rand": [
							6,
							0,
							0
						],
						"speedFactor": 2,
						"instStretch_rand": [
							0.25,
							0,
							0
						],
						"useRandomColor": true,
						"randomColor1": [
							0.10196078431372549,
							0.3411764705882353,
							1,
							1
						],
						"randomColor2": [
							0.7137254901960784,
							0.17254901960784313,
							0.17254901960784313,
							1
						],
						"lifeTimeRand": 0.2,
						"burstCount": 2,
						"burstDelay": 1.5
					},
					"rotationY": -90,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"rotationZ": 90,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"textureWrap": true,
											"emissive": 50
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/Spark.png",
										"onDecal": false
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
													"value": 0.9666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02352170282676526,
														"dt": -0.6051452312104698
													},
													"nextHandle": {
														"dv": 0.03222222222222226,
														"dt": 0.8296093750000002
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.26
													},
													"nextHandle": {
														"dv": -2.7214566023630135e-16,
														"dt": 0.33333569371893157
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.9,
										"ATTENUATE": true,
										"emissiveMap": null
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -2.524747126051018,
												"dt": -0.08435811334917986
											},
											"nextHandle": {
												"dv": 1.1363636363636365,
												"dt": 0.038593750000000024
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.015151515151515138,
												"dt": -0.6513281249999998
											},
											"nextHandle": {
												"dv": -0.007748222232672166,
												"dt": 0.333317624512036
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "instSpeed.x",
							"keys": [
								{
									"time": 0.06,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1,
									"value": 0.325,
									"mode": 0,
									"prevHandle": {
										"dv": -0.0214444444444446,
										"dt": -0.44000000000000006
									},
									"nextHandle": {
										"dv": 0.0214444444444446,
										"dt": 0.44000000000000006
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instStretch.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.52
									},
									"nextHandle": {
										"dv": -5.442874662877125e-16,
										"dt": 0.33333333333333326
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