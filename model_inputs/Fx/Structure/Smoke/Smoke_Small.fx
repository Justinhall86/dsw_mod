{
	"type": "fx",
	"cullingRadius": 10,
	"children": [
		{
			"type": "object",
			"name": "group",
			"enabled": false,
			"props": {
				"tag": "TURN OFF BEFORE SAVE"
			},
			"children": [
				{
					"type": "model",
					"name": "Camp",
					"source": "Structure/Camp/Camp.fbx",
					"x": -0.1,
					"y": -0.46,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Smoke01",
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0,
								"maxCount": 40,
								"lifeTimeRand": 0.2,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"emitShape": "Cone",
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"animationLoop": false,
								"spriteSheet": "Fx/Test/SpriteSheet_SmokeSand_4x4.png",
								"emitAngle": 0,
								"emitRate": 20,
								"instSpeed": [
									5,
									0,
									0
								]
							},
							"z": 0.1,
							"rotationY": -90,
							"children": [
								{
									"type": "model",
									"name": "HemiIcosphere",
									"source": "Fx/Meshes_Common/HemiIcosphere.fbx",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "DecalPass",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"textureWrap": true,
													"alphaKill": false,
													"emissive": 1
												}
											},
											"wrapRepeat": true,
											"mainPassName": "decal"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Structure/Smoke/T_DustCloud02.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": false,
												"colorA": [
													0.7254901960784313,
													0.7254901960784313,
													0.7254901960784313
												],
												"pointA": 0,
												"colorB": [
													0.7411764705882353,
													0.7411764705882353,
													0.7411764705882353
												],
												"pointB": 1
											},
											"isInstance": true
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
												"shiftSpeedY": 0
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
													"keys": [
														{
															"time": 0.42,
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
											"name": "Dissolve",
											"source": "shaders/Dissolve.hx",
											"props": {
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"useAlpha": false
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
															"value": 0.20111111111111107,
															"mode": 2
														},
														{
															"time": 0.06999999999999999,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.6649999999999999,
															"value": 0.2577777777777778,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0.1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2111111111111111,
																"dt": -0.19500000000000006
															},
															"nextHandle": {
																"dv": -0.16615829495135942,
																"dt": 0.151879066478977
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
												"range": 0.3,
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
											"value": 0.12239166666666623,
											"mode": 0,
											"prevHandle": {
												"dv": -0.9442018932607755,
												"dt": -0.3383996304415583
											},
											"nextHandle": {
												"dv": 0.5680045454545458,
												"dt": 0.20357142857142857
											}
										},
										{
											"time": 1.0107142857142857,
											"value": 1.2950462121212123,
											"mode": 0,
											"prevHandle": {
												"dv": -0.11909772727272738,
												"dt": -0.6142857142857143
											},
											"nextHandle": {
												"dv": 0.005155429549390596,
												"dt": 0.02659082415523382
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 5,
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
	]
}