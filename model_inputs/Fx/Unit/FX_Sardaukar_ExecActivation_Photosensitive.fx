{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.1,
			"scaleX": 0.9,
			"scaleY": 0.9,
			"scaleZ": 0.9,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"enabled": false,
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"x": -0.29879333333333336,
							"y": 1.38556,
							"scaleX": 1.0000000000000004,
							"scaleY": 1.0000000000000004,
							"rotationZ": -155.4,
							"children": [
								{
									"type": "model",
									"name": "Female01_AtreideRanger",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"x": -0.00415,
									"y": -0.01523,
									"scaleX": 1.9999999999999996,
									"scaleY": 1.9999999999999996,
									"scaleZ": 2,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle01.fbx"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Chara",
							"x": -1.0817533333333333,
							"y": -0.64968,
							"scaleX": 1.0000000000000004,
							"scaleY": 1.0000000000000004,
							"rotationZ": -155.4,
							"children": [
								{
									"type": "model",
									"name": "Female01_AtreideRanger",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"x": -0.00415,
									"y": -0.01523,
									"scaleX": 1.9999999999999996,
									"scaleY": 1.9999999999999996,
									"scaleZ": 2,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle01.fbx"
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Chara",
							"x": 1.3805466666666666,
							"y": -0.73588,
							"scaleX": 1.0000000000000004,
							"scaleY": 1.0000000000000004,
							"rotationZ": -155.4,
							"children": [
								{
									"type": "model",
									"name": "Female01_AtreideRanger",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"x": -0.00415,
									"y": -0.01523,
									"scaleX": 1.9999999999999996,
									"scaleY": 1.9999999999999996,
									"scaleZ": 2,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Anim_Male01_Idle01.fbx"
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "BolInfinty",
					"props": {
						"instRotation": [
							0,
							180,
							0
						],
						"emitRate": 2,
						"instStretch_rand": [
							0,
							0,
							0
						],
						"emitType": "Burst",
						"maxCount": 1
					},
					"z": -0.51961,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "model",
							"name": "Hemisphere",
							"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
							"scaleX": 6,
							"scaleY": 6,
							"scaleZ": 16,
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
										"alpha": 0.7,
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
													"time": 0.05,
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
											1,
											0.5843137254901961,
											0.4196078431372549
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
										"progress": 0.49,
										"saturation": 0,
										"width": 0.39,
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
										"progress": 0.4,
										"saturation": 0,
										"width": 0.27,
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.9138575870717927,
														"dt": -0.24282146558931608
													},
													"nextHandle": {
														"dv": 0.6,
														"dt": 0.05
													}
												},
												{
													"time": 0.09999999999999999,
													"value": 1.1,
													"mode": 0
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
										"range": 3,
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
							"name": "instStretch.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.7385318515164809,
										"dt": -0.0730416116884432
									},
									"nextHandle": {
										"dv": 1.0616666666666668,
										"dt": 0.105
									}
								},
								{
									"time": 0.69,
									"value": 1,
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
							"name": "instStretch.y",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.7385318515164809,
										"dt": -0.0730416116884432
									},
									"nextHandle": {
										"dv": 1.0616666666666668,
										"dt": 0.105
									}
								},
								{
									"time": 0.635,
									"value": 1,
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
					"name": "emitter",
					"props": {
						"lifeTime": 0.5,
						"emitType": "Burst",
						"alignMode": "Screen",
						"instScale": 25,
						"instOffset": [
							0,
							0,
							1
						]
					},
					"z": 2.18658,
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
									}
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
										"alpha": 0.2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle.png"
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.6705882352941176,
											0.5411764705882353
										]
									}
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 26.52,
										"power": 6.06
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
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.5148146026581708,
										"dt": -0.32663189869816805
									},
									"nextHandle": {
										"dv": -1.0666666666666667,
										"dt": 0.23000000000000004
									}
								},
								{
									"time": 0.98,
									"value": -0.01666666666666672,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3033333333333333
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.030000000000000027
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
						"amount": 0.85,
						"ATTENUATE": true,
						"emissiveMap": null
					}
				}
			]
		}
	]
}