{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "Units",
			"enabled": false,
			"editorOnly": true,
			"children": [
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": -1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": 1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				},
				{
					"type": "model",
					"name": "Male01_AtreideSoldier",
					"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
					"x": -1.5,
					"y": 1.5,
					"scaleX": 1.84,
					"scaleY": 1.84,
					"scaleZ": 1.84,
					"rotationZ": 89.99999999999999
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Operation",
					"z": 2.335636666666667,
					"scaleX": 1.45,
					"scaleY": 1.45,
					"scaleZ": 0.96,
					"children": [
						{
							"type": "object",
							"name": "Dots",
							"z": 1.741753333333334,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Dots",
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.2
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
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.82,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.075,
													0
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Dots",
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": -89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.2
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
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.82,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/bluenoise_raw.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.075,
													0
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.75
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
													"prevHandle": {
														"dv": -0.04114912760556359,
														"dt": -0.49996190040761035
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.405
													}
												},
												{
													"time": 0.9940525627136232,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 1,
										"envColorSet": false
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "object",
							"name": "Binary",
							"z": 1.7417525,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Binary",
									"z": 8.333333338939042e-7,
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 2,
												"vScale": 2,
												"uOffset": 1,
												"vOffset": 0,
												"texture": "Fx/Alphas/PatternBinaire03.png"
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
															"prevHandle": {
																"dv": -0.005498291401341124,
																"dt": -0.49999554920575573
															},
															"nextHandle": {
																"dv": 0.006614142142521984,
																"dt": 0.601420848316319
															}
														},
														{
															"time": 0.75,
															"value": 1,
															"prevHandle": {
																"dv": -0.6494504664463342,
																"dt": -0.15365482379573758
															},
															"nextHandle": {
																"dv": 0.28402804174627333,
																"dt": 0.06783518569047703
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.03488346516504388,
																"dt": -0.49998007134457845
															},
															"nextHandle": {
																"dv": 0.018831956581990716,
																"dt": 0.22303321678321686
															}
														},
														{
															"time": 0.3,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 2,
												"scrollSpeed": [
													-1,
													0
												],
												"scale": [
													4,
													4
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/circGrad01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.11764705882352941,
													0.11764705882352941
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
												},
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.845392794426938,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4676583115101631,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6811325409843927,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Binary",
									"enabled": false,
									"z": 8.333333338939042e-7,
									"scaleX": 150.00000000000003,
									"scaleY": 150.00000000000003,
									"scaleZ": 50,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 2,
												"vScale": 2,
												"uOffset": 1,
												"vOffset": 0,
												"texture": "Fx/Alphas/PatternBinaire05.png"
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
															"prevHandle": {
																"dv": -0.005498291401341124,
																"dt": -0.49999554920575573
															},
															"nextHandle": {
																"dv": 0.006614142142521984,
																"dt": 0.601420848316319
															}
														},
														{
															"time": 0.75,
															"value": 1,
															"prevHandle": {
																"dv": -0.6494504664463342,
																"dt": -0.15365482379573758
															},
															"nextHandle": {
																"dv": 0.28402804174627333,
																"dt": 0.06783518569047703
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.03488346516504388,
																"dt": -0.49998007134457845
															},
															"nextHandle": {
																"dv": 0.018831956581990716,
																"dt": 0.22303321678321686
															}
														},
														{
															"time": 0.3,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 2,
												"scrollSpeed": [
													0.5,
													0
												],
												"scale": [
													4,
													4
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 1,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.25,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/circGrad01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0.11764705882352941,
													0.11764705882352941
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
												},
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.845392794426938,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4676583115101631,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6811325409843927,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
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
													0.6078431372549019,
													0.43529411764705883,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.696810326979653,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7557515955013412,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.8816988895889188,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.940640158110607,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3826872527882204,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4416285213099083,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
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
													1,
													0.11764705882352941,
													0.11764705882352941
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.696810326979653,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7557515955013412,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.8816988895889188,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.940640158110607,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.3826872527882204,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.4416285213099083,
															"value": 0,
															"mode": 2
														},
														{
															"time": 3,
															"value": 0,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Glitch",
									"enabled": false,
									"z": 0.5938833333333338,
									"scaleX": 125,
									"scaleY": 125,
									"scaleZ": 41.67,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
									"fadePower": 1.64,
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 0,
												"width": 0.49,
												"uvScaleX": 2,
												"uvScaleY": 6,
												"texture": "Fx/noise/N_AnisotropicPixel.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.25
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 1,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 0,
												"width": 0.34,
												"uvScaleX": 2,
												"uvScaleY": 6,
												"texture": "Fx/noise/N_AnisotropicPixel.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.25
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keys": [
														{
															"time": 0.700096015930177,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.710096015930177,
															"value": 0.6632480621337892,
															"mode": 2
														},
														{
															"time": 0.8724153709411628,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.3808261871337897,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.39082618713379,
															"value": 0.6632480621337892,
															"mode": 2
														},
														{
															"time": 1.5125998115539558,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5225998115539559,
															"value": 0.6632480621337892,
															"mode": 2
														},
														{
															"time": 1.7153284645080569,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.995,
															"value": 1,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.62,
												"saturation": 0,
												"width": 0.17,
												"uvScaleX": 4,
												"uvScaleY": 6,
												"texture": "Fx/noise/N_AnisotropicPixel.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
												]
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
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "object",
									"name": "NumbersGlitches",
									"x": -4.40609,
									"y": 4.575680000000001,
									"z": -2.38222,
									"children": [
										{
											"type": "object",
											"name": "1",
											"x": -1.7763568394002505e-15,
											"children": [
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -15.509409999999995,
													"y": -28.39535,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0.6907953629227286,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7007953629227286,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3866722887312952,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -7.838789999999999,
													"y": -20.75146,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7007953629227286,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3866722887312952,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -7.838789999999999,
													"y": -1.37006,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 1.944055944055944,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7007953629227286,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3866722887312952,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -11.673309999999997,
													"y": 9.22665,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 1.944055944055944,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7007953629227286,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3866722887312952,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.944055944055944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -23.118089999999995,
													"y": -20.57339,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 1.944055944055944,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7007953629227286,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3866722887312952,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": 17.63604,
													"y": -12.039270000000002,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 1.944055944055944,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.6907953629227286,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 0.7007953629227286,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8756839255319944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.8856839255319944,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3766722887312952,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.3866722887312952,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.944055944055944,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 1,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
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
															0.11764705882352941,
															0.11764705882352941
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6907953629227286,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7007953629227286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8756839255319944,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8856839255319944,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3766722887312952,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3866722887312952,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
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
															0.4549019607843137,
															0.24705882352941178,
															0.9764705882352941
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6907953629227286,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7007953629227286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8756839255319944,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8856839255319944,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3766722887312952,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3866722887312952,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
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
															0.3176470588235294,
															0.24705882352941178,
															0.9764705882352941
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6907953629227286,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7007953629227286,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8756839255319944,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8856839255319944,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3766722887312952,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3866722887312952,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 1,
																	"mode": 2
																}
															],
															"loop": true
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "2",
											"x": -1.7763568394002505e-15,
											"children": [
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": 3.6012600000000017,
													"y": -6.67517,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 1.0438234749488995,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.8096312452231145,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.420495763680197,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 1.6247426826138491,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9132867132867133,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.3106196084224173,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.4304957636801974,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.25,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -0.2905599999999984,
													"y": 6.09491,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 1.0438234749488995,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.8096312452231145,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.420495763680197,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 1.6247426826138491,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9132867132867133,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.3106196084224173,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.4304957636801974,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.25,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -0.2531099999999977,
													"y": -31.52708,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 1.0438234749488995,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.8096312452231145,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.420495763680197,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 1.6247426826138491,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9132867132867133,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.3106196084224173,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.4304957636801974,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.25,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": -23.128,
													"y": 17.920140000000004,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 1.0438234749488995,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.8096312452231145,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.420495763680197,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 1.6247426826138491,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9132867132867133,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.3106196084224173,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.4304957636801974,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.25,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "advancedDecal",
													"name": "unités",
													"x": 6.151820000000002,
													"y": 19.704549999999998,
													"scaleX": 2.25,
													"scaleY": 2.25,
													"scaleZ": 10,
													"rotationZ": 89.99999999999999,
													"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
													"emissive": 1,
													"renderMode": "BeforeTonemapping",
													"children": [
														{
															"type": "shader",
															"name": "AnimatedTexture",
															"source": "h3d.shader.AnimatedTexture",
															"props": {
																"startFrame": 1,
																"texture": "Fx/Alphas/PatternBinaire_anim.png",
																"speed": 0,
																"frameDivision": [
																	2,
																	1
																],
																"totalFrames": 10,
																"startTime": 1,
																"loop": false,
																"useSourceUVs": false,
																"blendBetweenFrames": false
															},
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "startFrame",
																	"keys": [
																		{
																			"time": 1.0438234749488995,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.8096312452231145,
																			"value": 5,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.420495763680197,
																			"value": 10,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 10,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "AutoAlpha",
															"source": "shaders/AutoAlpha.hx",
															"props": {
																"scale": 1
															},
															"children": [
																{
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 1.6247426826138491,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1.7132999803777171,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9132867132867133,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 1.9295074004808936,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.3106196084224173,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.4304957636801974,
																			"value": 0.25,
																			"mode": 2
																		},
																		{
																			"time": 3,
																			"value": 0.25,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
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
															0.11764705882352941,
															0.11764705882352941
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.696810326979653,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.7557515955013412,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.8816988895889188,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.940640158110607,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3826872527882204,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.4416285213099083,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
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
															0.3176470588235294,
															0.24705882352941178,
															0.9764705882352941
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.696810326979653,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.7557515955013412,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.8816988895889188,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.940640158110607,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3826872527882204,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.4416285213099083,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 0,
																	"mode": 2
																}
															],
															"loop": true
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
												"alpha": 1
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
															"prevHandle": {
																"dv": -0.03488346516504388,
																"dt": -0.49998007134457845
															},
															"nextHandle": {
																"dv": 0.018831956581990716,
																"dt": 0.22303321678321686
															}
														},
														{
															"time": 0.3,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "material",
											"name": "material",
											"enabled": false,
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 3
												}
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
	]
}