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
							"name": "Binary",
							"z": 1.7417525,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Network01",
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
												"alpha": 1,
												"uScale": 2,
												"vScale": 2,
												"uOffset": 1,
												"vOffset": 0,
												"texture": "Fx/Alphas/PatternNetwork04.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2,
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
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.94,
												"scrollSpeed": [
													-0.1,
													0
												],
												"scale": [
													2,
													4
												]
											}
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Network01",
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
												"useSourceUVs": true,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 2,
												"vScale": 2,
												"uOffset": 1,
												"vOffset": 0,
												"texture": "Fx/Alphas/PatternNetwork05.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.0098732642145523,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2,
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
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 0.94,
												"scrollSpeed": [
													0,
													-0.2
												],
												"scale": [
													2,
													2
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
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
									"name": "advancedDecal_Dots",
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.5,
												"uScale": 2,
												"vScale": 2,
												"uOffset": 1,
												"vOffset": 0,
												"texture": "Fx/Alphas/PatternNetwork03.png"
											},
											"children": [
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
																"dv": -0.6733280734774908,
																"dt": -0.024478071779704007
															},
															"nextHandle": {
																"dv": 1.020429548545721,
																"dt": 0.036667961667961935
															}
														},
														{
															"time": 0.2,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
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
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 1
											}
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
											}
										},
										{
											"type": "shader",
											"name": "UVDistortion",
											"source": "shaders/UVDistortion.hx",
											"enabled": false,
											"props": {
												"noiseTexture": "Fx/noise/T_Fire.png",
												"directionalNoise": false,
												"intensity": 2,
												"scrollSpeed": [
													-0.2,
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
														"dv": -0.010621791163389894,
														"dt": -0.5000205002486824
													},
													"nextHandle": {
														"dv": 0.009173595038003024,
														"dt": 0.6279003370569355
													}
												},
												{
													"time": 0.75,
													"value": 1,
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
	]
}