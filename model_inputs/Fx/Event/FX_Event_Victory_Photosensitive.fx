{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
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
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.25,
			"scaleY": 1.25,
			"scaleZ": 1.25,
			"children": [
				{
					"type": "emitter",
					"name": "Flare",
					"props": {
						"emitType": "Burst",
						"alignMode": "Axis",
						"instScale": 7,
						"instStretch": [
							2.5,
							30,
							1
						],
						"lifeTime": 2
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0
										}
									},
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
										"alpha": 0.4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05v_A.png",
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.19,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.02
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3133333333333333
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.66,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.6
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl04v_A.jpg"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 15,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instStretch.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.020241579549130004,
										"dt": -0.18533853745173157
									},
									"nextHandle": {
										"dv": 0.037500000000000026,
										"dt": 0.3433058984910838
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9960410845230232,
									"value": 1.8000000000000012,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.22752087249572386
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22752087249572386
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
									"mode": 0,
									"prevHandle": {
										"dv": -33.533984799045044,
										"dt": -1.7663991992912587
									},
									"nextHandle": {
										"dv": 0.7773083847736577,
										"dt": 0.041563277955596195
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0.014345421810695314,
										"dt": -0.11098579146132875
									},
									"nextHandle": {
										"dv": -0.014345421810695314,
										"dt": 0.11098579146132875
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Sparks",
					"props": {
						"emitType": "Burst",
						"alignMode": "Axis",
						"instScale": 1.5,
						"instStretch": [
							0.4,
							1.3,
							0.4
						],
						"lifeTime": 2,
						"burstParticleCount": 30,
						"maxCount": 30,
						"emitShape": "Cylinder",
						"instAcceleration": [
							0,
							0,
							15
						],
						"instAcceleration_rand": [
							0,
							0,
							8
						],
						"instScale_rand": 0.5,
						"instStretch_rand": [
							0.2,
							0.6,
							0.2
						]
					},
					"x": -1.83489,
					"z": 16.51755,
					"scaleX": 25,
					"scaleY": 25,
					"scaleZ": 25,
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
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"parallax": 0,
											"emissive": 2,
											"drawOrder": "120"
										}
									},
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
										"alpha": 0.4,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05v_A.png",
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
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.19,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.02
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3133333333333333
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.66,
										"uvScaleX": 1,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.6
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.7,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle2.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl04v_A.jpg"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 15,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instStretch.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.020241579549130004,
										"dt": -0.18533853745173157
									},
									"nextHandle": {
										"dv": 0.037500000000000026,
										"dt": 0.3433058984910838
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9960410845230232,
									"value": 1.8000000000000012,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.22752087249572386
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22752087249572386
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
									"mode": 0,
									"prevHandle": {
										"dv": -33.533984799045044,
										"dt": -1.7663991992912587
									},
									"nextHandle": {
										"dv": 0.7773083847736577,
										"dt": 0.041563277955596195
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0.014345421810695314,
										"dt": -0.11098579146132875
									},
									"nextHandle": {
										"dv": -0.014345421810695314,
										"dt": 0.11098579146132875
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "BolSharp",
					"props": {
						"emitType": "Burst",
						"instScale": 7,
						"lifeTime": 2,
						"instRotation": [
							0,
							180,
							0
						]
					},
					"x": 1.32445,
					"y": -0.15279,
					"z": -3.22966,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Hemisphere",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 7,
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
											"enableStencil": false,
											"parallax": 0,
											"emissive": 2
										}
									},
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
										"alpha": 0.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png",
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
													"time": 0.14040999847584212,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.12122382132456926,
														"dt": -0.4994842701051498
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.13734491693339435
													}
												},
												{
													"time": 0.35891327541533313,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.02
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3133333333333333
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.26,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.4
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.29,
										"uvScaleX": 4,
										"uvScaleY": 4,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.3
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
													"time": 0.2090824569425393,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11604552724598342,
														"dt": -0.49988189441195807
													},
													"nextHandle": {
														"dv": -0.06666666666666665,
														"dt": 0.2871757354061881
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
									"props": {
										"REVERSE": false,
										"range": 15,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instStretch.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 2.1815539740246592e-16,
										"dt": -0.18535050365489164
									},
									"nextHandle": {
										"dv": 1.1102230246251565e-16,
										"dt": 0.21844688309708893
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9960410845230232,
									"value": 1.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.22752087249572386
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22752087249572386
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
									"mode": 0,
									"prevHandle": {
										"dv": 0.02664527370121003,
										"dt": -0.1853207988671051
									},
									"nextHandle": {
										"dv": -0.02664527370121003,
										"dt": 0.1853207988671051
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9960410845230232,
									"value": 1.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.22752087249572386
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22752087249572386
									}
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Bol",
					"props": {
						"emitType": "Burst",
						"instScale": 7,
						"lifeTime": 2,
						"instRotation": [
							0,
							180,
							0
						]
					},
					"x": 1.32445,
					"y": -0.15279,
					"z": -3.22966,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Hemisphere",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 5,
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
											"enableStencil": false,
											"parallax": 0,
											"emissive": 2
										}
									},
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
										"alpha": 0.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/GradientSpice_2.png",
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
													"time": 0.14040999847584212,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.12122382132456926,
														"dt": -0.4994842701051498
													},
													"nextHandle": {
														"dv": 0.033333333333333326,
														"dt": 0.13734491693339435
													}
												},
												{
													"time": 0.35891327541533313,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.02
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3133333333333333
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
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.37,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.4
										],
										"uvScaleSpeed": [
											0,
											0
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
										"progress": 0.48,
										"saturation": 0,
										"width": 0.4,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.3
										],
										"uvScaleSpeed": [
											0,
											0
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
										"range": 15,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "curve",
							"name": "instStretch.y",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 2.1815539740246592e-16,
										"dt": -0.18535050365489164
									},
									"nextHandle": {
										"dv": 1.1102230246251565e-16,
										"dt": 0.21844688309708893
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9960410845230232,
									"value": 1.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.22752087249572386
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22752087249572386
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
									"mode": 0,
									"prevHandle": {
										"dv": 0.02664527370121003,
										"dt": -0.1853207988671051
									},
									"nextHandle": {
										"dv": -0.02664527370121003,
										"dt": 0.1853207988671051
									}
								},
								{
									"time": 0.28087639079408633,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.9960410845230232,
									"value": 1.3,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.22752087249572386
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.22752087249572386
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Loop",
					"x": -1.8348900000000001,
					"z": 7.67934,
					"children": [
						{
							"type": "emitter",
							"name": "Sparks",
							"props": {
								"alignMode": "Axis",
								"instScale": 1.2,
								"instStretch": [
									0.7,
									1,
									0.7
								],
								"lifeTime": 2,
								"burstParticleCount": 30,
								"maxCount": 100,
								"emitShape": "Cylinder",
								"instAcceleration": [
									0,
									0,
									15
								],
								"instAcceleration_rand": [
									0,
									0,
									8
								],
								"instScale_rand": 0.5,
								"instStretch_rand": [
									0.2,
									0.7,
									0.2
								],
								"emitRate": 30
							},
							"z": 4.910300000000001,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 20,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
													"emissive": 2,
													"drawOrder": "120"
												}
											},
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
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.19,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
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
												"progress": 0.34,
												"saturation": 0,
												"width": 0.66,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlarescreenInfinty",
							"props": {
								"alignMode": "Screen",
								"instScale": 50,
								"lifeTime": 2,
								"instOffset": [
									0,
									0,
									1
								],
								"emitRate": 3
							},
							"x": 1.8348900000000001,
							"z": 0.6821099999999998,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.0031778692272519393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5056226185032769,
															"value": 1,
															"mode": 2
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
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.05,
										"ATTENUATE": false,
										"emissiveMap": "Fx/Gradients/z_FillGrey50.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlarescreenInfinty",
							"props": {
								"instScale": 150,
								"lifeTime": 2,
								"instOffset": [
									0,
									0,
									1
								],
								"emitRate": 3
							},
							"x": 1.83489,
							"z": -4.63337,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.0031778692272519393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5056226185032769,
															"value": 1,
															"mode": 2
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
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "BolInfinty",
							"props": {
								"instScale": 7,
								"instRotation": [
									0,
									180,
									0
								],
								"emitRate": 2
							},
							"x": 3.15934,
							"y": -0.15279,
							"z": -12.70042,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Hemisphere",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 5,
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
													"enableStencil": false,
													"parallax": 0
												}
											},
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
												"alpha": 0.3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.0031778692272519393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5056226185032769,
															"value": 1,
															"mode": 2
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
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
												"progress": 0.4,
												"saturation": 0,
												"width": 0.56,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.48,
												"saturation": 0,
												"width": 0.55,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
												],
												"uvScaleSpeed": [
													0,
													0
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
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "BolSharpInfinty",
							"props": {
								"instScale": 7,
								"lifeTime": 2,
								"instRotation": [
									0,
									180,
									0
								],
								"emitRate": 2
							},
							"x": 3.15934,
							"y": -0.15279,
							"z": -12.70042,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Hemisphere",
									"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 7,
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
													"enableStencil": false,
													"parallax": 0
												}
											},
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
												"alpha": 0.3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/GradientSpice_2.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.0031778692272519393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5056226185032769,
															"value": 1,
															"mode": 2
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
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
												"progress": 0.34,
												"saturation": 0,
												"width": 0.37,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.4
												],
												"uvScaleSpeed": [
													0,
													0
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
												"progress": 0.34,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 4,
												"uvScaleY": 4,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.3
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
															"time": 0.2090824569425393,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.11604552724598342,
																"dt": -0.49988189441195807
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.2871757354061881
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
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareInfiny",
							"props": {
								"alignMode": "Axis",
								"instScale": 7,
								"instStretch": [
									2.5,
									30,
									1
								],
								"warmUpTime": -0.55,
								"emitRate": 2
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
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
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
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
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": -0.0031778692272519393,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5056226185032769,
															"value": 1,
															"mode": 2
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keys": [
										{
											"time": 0.7647050754458163,
											"value": 0.03333333333333333,
											"mode": 2
										},
										{
											"time": 1.9914449016918156,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"enabled": false,
							"props": {
								"amount": 0.48,
								"ATTENUATE": true,
								"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
							}
						}
					]
				},
				{
					"type": "object",
					"name": "group",
					"children": [
						{
							"type": "emitter",
							"name": "Flare",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 70,
								"lifeTime": 2
							},
							"x": -2.2936125,
							"z": 12.21255,
							"scaleX": 0.125,
							"scaleY": 0.125,
							"scaleZ": 0.125,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
													"emissive": 2
												}
											},
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_05.png",
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.003887512018776604,
																"dt": -0.1854343232956407
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.7949999999999999
															}
														},
														{
															"time": 0.28087639079408633,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4588235294117647,
													0.38823529411764707,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.020241579549130004,
												"dt": -0.18533853745173157
											},
											"nextHandle": {
												"dv": 0.037500000000000026,
												"dt": 0.3433058984910838
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.8000000000000012,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.22752087249572386
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.22752087249572386
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -33.533984799045044,
												"dt": -1.7663991992912587
											},
											"nextHandle": {
												"dv": 0.7773083847736577,
												"dt": 0.041563277955596195
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.014345421810695314,
												"dt": -0.11098579146132875
											},
											"nextHandle": {
												"dv": -0.014345421810695314,
												"dt": 0.11098579146132875
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Flare",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 72,
								"lifeTime": 2
							},
							"x": -2.2936125,
							"z": 12.21255,
							"scaleX": 0.125,
							"scaleY": 0.125,
							"scaleZ": 0.125,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
													"emissive": 2
												}
											},
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_05.png",
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.003887512018776604,
																"dt": -0.1854343232956407
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.7949999999999999
															}
														},
														{
															"time": 0.28087639079408633,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.8274509803921568,
													0.6078431372549019
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.020241579549130004,
												"dt": -0.18533853745173157
											},
											"nextHandle": {
												"dv": 0.037500000000000026,
												"dt": 0.3433058984910838
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.8000000000000012,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.22752087249572386
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.22752087249572386
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -33.533984799045044,
												"dt": -1.7663991992912587
											},
											"nextHandle": {
												"dv": 0.7773083847736577,
												"dt": 0.041563277955596195
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.014345421810695314,
												"dt": -0.11098579146132875
											},
											"nextHandle": {
												"dv": -0.014345421810695314,
												"dt": 0.11098579146132875
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Flare",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 74,
								"lifeTime": 2
							},
							"x": -2.2936125,
							"z": 12.21255,
							"scaleX": 0.125,
							"scaleY": 0.125,
							"scaleZ": 0.125,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0,
													"emissive": 2
												}
											},
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
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_05.png",
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
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.003887512018776604,
																"dt": -0.1854343232956407
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.7949999999999999
															}
														},
														{
															"time": 0.28087639079408633,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.22752087249572386
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.22752087249572386
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.y",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.020241579549130004,
												"dt": -0.18533853745173157
											},
											"nextHandle": {
												"dv": 0.037500000000000026,
												"dt": 0.3433058984910838
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9960410845230232,
											"value": 1.8000000000000012,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.22752087249572386
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.22752087249572386
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -33.533984799045044,
												"dt": -1.7663991992912587
											},
											"nextHandle": {
												"dv": 0.7773083847736577,
												"dt": 0.041563277955596195
											}
										},
										{
											"time": 0.28087639079408633,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.014345421810695314,
												"dt": -0.11098579146132875
											},
											"nextHandle": {
												"dv": -0.014345421810695314,
												"dt": 0.11098579146132875
											}
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keys": [
								{
									"time": 0,
									"value": 0.6006774902343752,
									"mode": 2
								},
								{
									"time": 1.9999999999999998,
									"value": 1.4238281250000007,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "ShockWave",
					"enabled": false,
					"props": {
						"warmUpTime": -0.45,
						"emitType": "Burst",
						"instScale": 330
					},
					"x": -3.41554,
					"y": 1.47042,
					"z": 7.93035,
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
											"colorMask": 255,
											"depthTest": "LessEqual"
										}
									},
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
										"alpha": 0.3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.43333333333333335,
														"dt": -0.516227709190672
													},
													"nextHandle": {
														"dv": -0.27699273452149137,
														"dt": 0.3292229779096851
													}
												}
											]
										}
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.8,
										"envColorSet": false
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
										"width": 0.78,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_03.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
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
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.6388909936641954,
										"dt": -0.10067371854478592
									},
									"nextHandle": {
										"dv": 1.365952273458243,
										"dt": 0.21220393232738916
									}
								},
								{
									"time": 1,
									"value": 1.0773015156388288,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Distort_Chockwave",
					"enabled": false,
					"props": {
						"instScale_rand": 0,
						"maxCount": 50,
						"simulationSpace": "World",
						"animationSpeed": 0,
						"randomColor1": [
							1,
							1,
							1,
							1
						],
						"randomColor2": [
							0.9098039215686274,
							0.615686274509804,
							1,
							0.8509803921568627
						],
						"emitRate": 10,
						"enableSort": false,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
						"emitType": "Burst",
						"burstDelay": 0.3,
						"useRandomColor": true,
						"emitShape": "Cylinder",
						"emitSurface": true,
						"warmUpTime": -0.5,
						"instWorldAcceleration_rand": [
							0,
							0,
							0
						],
						"instScale": 1.8,
						"alignMode": "Screen",
						"instOffset": [
							0,
							0,
							30
						]
					},
					"z": 31.57076,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.05,
					"children": [
						{
							"type": "model",
							"name": "Ring",
							"source": "Fx/Meshes_Common/DiskFlat.fbx",
							"scaleX": 200,
							"scaleY": 200,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"culling": "None",
											"depthWrite": "On",
											"drawOrder": "-100"
										}
									},
									"diffuseMap": "Fx/noise/causticTexture_03-2.png"
								},
								{
									"type": "shader",
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/water-normal.png",
										"intensity": 0.05
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.8043636363636364,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5969588995728569,
														"dt": -0.2623791435549754
													},
													"nextHandle": {
														"dv": -0.5969588995728569,
														"dt": 0.2623791435549754
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08425454545454536,
														"dt": -0.2350000000000001
													},
													"nextHandle": {
														"dv": -0.08425454545454536,
														"dt": 0.2350000000000001
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.5,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": 0,
										"shiftSpeedY": -0.01
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
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
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
											"name": "width",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5350976805491343,
													"value": 0.9422222222222223,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.03695353771889259
													},
													"nextHandle": {
														"dv": -6.922428196740585e-16,
														"dt": 0.24478506621704163
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.5,
														"dt": -0.18500000000000005
													},
													"nextHandle": {
														"dv": -0.8474237452673484,
														"dt": 0.3135467857489186
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
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
									"time": 0.0049999999999999975,
									"value": 0.0402048299726524,
									"mode": 0,
									"prevHandle": {
										"dv": -0.9239350146379692,
										"dt": -0.3456633226416698
									},
									"nextHandle": {
										"dv": 0.12028199966650588,
										"dt": 0.045000000000000005
									}
								},
								{
									"time": 1,
									"value": 1.0158254939343108,
									"mode": 0,
									"prevHandle": {
										"dv": -0.026729333259223442,
										"dt": -0.865
									},
									"nextHandle": {
										"dv": 0.0103433736750329,
										"dt": 0.33472657705803693
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "group",
					"enabled": false,
					"z": 9.656262857142856,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": 1.1901071428571441,
							"scaleX": 200,
							"scaleY": 200,
							"scaleZ": 50,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 3.323898806028511e-16,
														"dt": -0.49999944477943
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.5649306508154246
													}
												},
												{
													"time": 0.49313671696387756,
													"value": 1.0166666666666666,
													"mode": 2
												},
												{
													"time": 1.9976878524615154,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.9319444444444444,
														"dt": -0.32463344002438665
													},
													"nextHandle": {
														"dv": -0.5026954750315817,
														"dt": 0.175108894437885
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.9764705882352941,
											0.7529411764705882,
											0.5137254901960784
										]
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9450980392156862,
											0.6549019607843137,
											0.34901960784313724
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": 1.1901071428571441,
							"scaleX": 2500,
							"scaleY": 2500,
							"scaleZ": 100,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 2,
							"fadeStart": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.7
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0813884639086944,
														"dt": -0.49977459679029407
													},
													"nextHandle": {
														"dv": 0.05083333333333334,
														"dt": 0.312091144642585
													}
												},
												{
													"time": 0.43382868465173,
													"value": 1.0166666666666666,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.397611644566377
													},
													"nextHandle": {
														"dv": -2.633703423021238e-16,
														"dt": 0.19808819793730628
													}
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
											0,
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareGround",
							"props": {
								"emitType": "Burst",
								"instScale": 25,
								"lifeTime": 0.5,
								"instOffset": [
									0,
									0,
									1
								]
							},
							"z": -6.9390528571428565,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3153236153651962,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.4,
																"dt": -0.040379546604235594
															},
															"nextHandle": {
																"dv": 0.614600230694067,
																"dt": 0.01603771273438879
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareGround",
							"props": {
								"emitType": "Burst",
								"instScale": 50,
								"lifeTime": 2,
								"instOffset": [
									0,
									0,
									1
								]
							},
							"z": 2.244727142857144,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3153236153651962,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.4,
																"dt": -0.040379546604235594
															},
															"nextHandle": {
																"dv": 0.614600230694067,
																"dt": 0.01603771273438879
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": false,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Flarescreen",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 75,
								"lifeTime": 0.5,
								"instOffset": [
									0,
									0,
									1
								]
							},
							"z": -1.2948128571428565,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.7,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.337436981201172,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1333333333333333,
																"dt": -0.050000000000000044
															},
															"nextHandle": {
																"dv": 0.6141901939981789,
																"dt": 0.029366779035477106
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 1,
										"ATTENUATE": true,
										"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Flarescreen",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale": 150,
								"lifeTime": 2,
								"instOffset": [
									0,
									0,
									1
								]
							},
							"z": -1.2948128571428565,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.337436981201172,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1333333333333333,
																"dt": -0.050000000000000044
															},
															"nextHandle": {
																"dv": 0.6141901939981789,
																"dt": 0.029366779035477106
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 0,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 1,
												"ATTENUATE": true,
												"emissiveMap": "Fx/Gradients/z_FillBlack.jpg"
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareLarge",
							"props": {
								"emitType": "Burst",
								"alignMode": "Axis",
								"instScale": 7,
								"instStretch": [
									2,
									20,
									1
								],
								"lifeTime": 0.8
							},
							"z": 4.903737142857146,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 3,
									"scaleZ": 0.7,
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
													"enableStencil": false,
													"parallax": 0
												}
											},
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
												"texture": "Fx/Gradients/Cyl05v_A.png",
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
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.19,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
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
												"progress": 0.34,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.6
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.65,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"enabled": false,
											"props": {
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 0.3
							}
						}
					]
				}
			]
		}
	]
}