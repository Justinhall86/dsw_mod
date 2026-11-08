{
	"type": "fx",
	"duration": 2,
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
			"children": [
				{
					"type": "model",
					"name": "Female01_Infiltrator",
					"source": "Character/Harkonnen/Unit/Cerberus/Male01_Cerberus.fbx",
					"editorOnly": true,
					"scaleX": 2.3,
					"scaleY": 2.3,
					"scaleZ": 2.3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": -0.1,
							"animation": "Anim/Male01/Claws/Anim_Male01_Claws_AttackMelee02.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Hit",
					"x": 6.93919,
					"y": -0.34532,
					"z": 2.72774,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "emitter",
							"name": "Hit_Spikes",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": 0.29,
								"instScale": 1.5,
								"burstCount": 4,
								"burstDelay": 0.15
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 1
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
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
												"texture": "Fx/Alphas/T_FlatImpact01.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/clouds.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.46180444404066,
															"value": 0.01416666666666666,
															"mode": 1,
															"prevHandle": {
																"dv": 0.3775126578654911,
																"dt": -0.49657530216143814
															},
															"nextHandle": {
																"dv": 0.023114784558614043,
																"dt": 0.08500000000000008
															}
														},
														{
															"time": 0.5568044440406601,
															"value": 0.9419580650329591,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.80180444404066,
															"value": 0,
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
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 200,
												"power": 23.48
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
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.30180444404066004,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.85180444404066,
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
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03236093441864362,
												"dt": -0.49997643676805403
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.5149999999999999
											}
										},
										{
											"time": 0.85180444404066,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Hit_Round",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": 0.29,
								"instScale": 1.5,
								"burstCount": 4,
								"burstDelay": 0.15
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_05.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.46180444404066,
															"value": 0.01416666666666666,
															"mode": 1,
															"prevHandle": {
																"dv": 0.3775126578654911,
																"dt": -0.49657530216143814
															},
															"nextHandle": {
																"dv": 0.023114784558614043,
																"dt": 0.08500000000000008
															}
														},
														{
															"time": 0.5568044440406601,
															"value": 0.9419580650329591,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.80180444404066,
															"value": 0,
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
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 200,
												"power": 23.48
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
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.30180444404066004,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.85180444404066,
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
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03236093441864362,
												"dt": -0.49997643676805403
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.5149999999999999
											}
										},
										{
											"time": 0.85180444404066,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "HitFinal",
					"x": 6.93919,
					"y": -0.34532,
					"z": 2.72774,
					"children": [
						{
							"type": "emitter",
							"name": "Hit_Spikes",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": -0.55,
								"instScale": 1.5
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 1
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
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
												"texture": "Fx/Alphas/T_FlatImpact01.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/clouds.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.46180444404066,
															"value": 0.01416666666666666,
															"mode": 1,
															"prevHandle": {
																"dv": 0.3775126578654911,
																"dt": -0.49657530216143814
															},
															"nextHandle": {
																"dv": 0.023114784558614043,
																"dt": 0.08500000000000008
															}
														},
														{
															"time": 0.5568044440406601,
															"value": 0.9419580650329591,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.80180444404066,
															"value": 0,
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
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 200,
												"power": 23.48
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
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.30180444404066004,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.85180444404066,
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
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03236093441864362,
												"dt": -0.49997643676805403
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.5149999999999999
											}
										},
										{
											"time": 0.85180444404066,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Hit_Round",
							"props": {
								"emitType": "Burst",
								"alignMode": "Screen",
								"instScale_rand": 0.25,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"warmUpTime": -0.55,
								"instScale": 1.5
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 7,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_05.png"
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds.png",
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
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.46180444404066,
															"value": 0.01416666666666666,
															"mode": 1,
															"prevHandle": {
																"dv": 0.3775126578654911,
																"dt": -0.49657530216143814
															},
															"nextHandle": {
																"dv": 0.023114784558614043,
																"dt": 0.08500000000000008
															}
														},
														{
															"time": 0.5568044440406601,
															"value": 0.9419580650329591,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.8723667347431184,
																"dt": 0.07999999999999996
															}
														},
														{
															"time": 0.80180444404066,
															"value": 0,
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
												"sandBlend": 0.7,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 200,
												"power": 23.48
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
													0.6980392156862745,
													0.34901960784313724
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.30180444404066004,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.85180444404066,
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
													0.9921568627450981,
													0.8235294117647058,
													0.6627450980392157
												]
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.03236093441864362,
												"dt": -0.49997643676805403
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.5149999999999999
											}
										},
										{
											"time": 0.85180444404066,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "ArmL",
					"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
					"x": 0.49341999999999997,
					"y": 1.1033199999999999,
					"z": 3.70884,
					"scaleX": 0.6,
					"scaleY": 0.5999999999999998,
					"scaleZ": 4,
					"rotationX": 6.099999999999989,
					"rotationY": 97.4,
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
									"emissive": 0.1
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
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 2.27,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.18,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.04547237692926176,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.22103623810115458,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3460556681427448,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.4130131889567452,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5446,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.6696,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": 0.006250000000000089,
												"dt": -0.048634745271823876
											},
											"nextHandle": {
												"dv": 0.006250000000000089,
												"dt": 0.04223821883473844
											}
										},
										{
											"time": 0.7366,
											"value": 0,
											"mode": 0
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
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.08,
								"vOffset": 0,
								"texture": "Fx/Gradients/uGrad.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.04547237692926176,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.22103623810115458,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3460556681427448,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.4130131889567452,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.041899793662877126
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.5446,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.6696,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": 0.010575866699218839,
												"dt": -0.0513884714568712
											},
											"nextHandle": {
												"dv": -1.1130641966295477e-16,
												"dt": 0.041666666666666664
											}
										},
										{
											"time": 0.7366,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.040609741210937744,
												"dt": -0.03990727518302195
											},
											"nextHandle": {
												"dv": 0.040609741210937744,
												"dt": 0.03990727518302195
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
									0.9921568627450981,
									0.8235294117647058,
									0.6627450980392157
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.52,
								"saturation": 1,
								"width": 0.15,
								"uvScaleX": 0.14,
								"uvScaleY": 0.73,
								"texture": "Fx/noise/Wave_01.jpg",
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
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.53,
								"scaleY": 1,
								"shiftX": 1,
								"shiftY": 1,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.11640646029609703,
											"value": 0.05111111111111105,
											"mode": 0,
											"prevHandle": {
												"dv": 4.082155997157844e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.07999999999999996
											}
										},
										{
											"time": 0.34665206664856174,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.10833333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.10833333333333332
											}
										},
										{
											"time": 0.44,
											"value": 0.05111,
											"mode": 1,
											"prevHandle": {
												"dv": 0.5851492592592593,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0.0000011111111111045124,
												"dt": 0.0818311120664717
											}
										},
										{
											"time": 0.6702,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0159692821593561,
												"dt": -0.10705396754321818
											},
											"nextHandle": {
												"dv": -0.015814814814814726,
												"dt": 0.10635078418335098
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.79,
								"saturation": 1,
								"width": 0.12,
								"uvScaleX": 0.14,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "width",
									"keys": [
										{
											"time": 0.3480307828542651,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.60406110355573,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6716,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9276,
											"value": 0,
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
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.33,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 0.98,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/uGrad.png",
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
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": false,
								"wrap": true,
								"progress": 0.93,
								"saturation": 1,
								"width": 0.11,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/Cyl15u_A.png",
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
					"type": "model",
					"name": "ArmR",
					"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
					"x": 0.48189999999999983,
					"y": -0.7893599999999998,
					"z": 3.71034,
					"scaleX": 0.6000000000000001,
					"scaleY": 0.5999999999999999,
					"scaleZ": 3.999999999999999,
					"rotationY": 97.40000000000003,
					"rotationZ": -5.144706622319903e-15,
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
									"emissive": 0.1
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
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 2.27,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.18,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square03.jpg"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.04547237692926176,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.10462977780505756,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.22964920784664777,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.2966067286606482,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.442,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.567,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666607,
												"dt": -0.05150113274473689
											},
											"nextHandle": {
												"dv": -0.013066941369353657,
												"dt": 0.04051477737654287
											}
										},
										{
											"time": 0.634,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.9136,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.072,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.052800000000000034
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.043666666666666666
											}
										},
										{
											"time": 1.203,
											"value": 0,
											"mode": 0
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
								"useSourceUVs": true,
								"onDecal": false,
								"wrap": false,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": -0.08,
								"vOffset": 0,
								"texture": "Fx/Gradients/uGrad.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.04547237692926176,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.10462977780505756,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.22964920784664777,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.050279752395452515
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.2966067286606482,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.041899793662877126
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041899793662877126
											}
										},
										{
											"time": 0.442,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.567,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.019455657187394358,
												"dt": -0.05149553889437104
											},
											"nextHandle": {
												"dv": -0.016666666666666607,
												"dt": 0.04428838782103328
											}
										},
										{
											"time": 0.634,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 6.943652243158817e-17,
												"dt": -0.04287782703491838
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.041568197674379026
											}
										},
										{
											"time": 0.9136,
											"value": 0,
											"mode": 0
										},
										{
											"time": 1.072,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.052800000000000034
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.043666666666666666
											}
										},
										{
											"time": 1.203,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.043666666666666666
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.043666666666666666
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
									0.9921568627450981,
									0.8235294117647058,
									0.6627450980392157
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.52,
								"saturation": 1,
								"width": 0.15,
								"uvScaleX": 0.14,
								"uvScaleY": 0.73,
								"texture": "Fx/noise/Wave_01.jpg",
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
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.53,
								"scaleY": 1,
								"shiftX": 1,
								"shiftY": 1,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.05111111111111105,
											"mode": 0,
											"prevHandle": {
												"dv": 4.082155997157844e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.07999999999999996
											}
										},
										{
											"time": 0.2302456063524647,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.10833333333333332
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.10833333333333332
											}
										},
										{
											"time": 0.3374,
											"value": 0.05111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.015813703703703733,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0.0000011111111111045124,
												"dt": 0.07978856983249899
											}
										},
										{
											"time": 0.5676,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.02001508401426786,
												"dt": -0.10635601342205836
											},
											"nextHandle": {
												"dv": -0.015814814814814726,
												"dt": 0.08425187079496
											}
										},
										{
											"time": 0.817,
											"value": 0.05111,
											"mode": 1,
											"prevHandle": {
												"dv": 1.122852962962963,
												"dt": 0
											},
											"nextHandle": {
												"dv": 0.015815925925925886,
												"dt": 0.0801480451707639
											}
										},
										{
											"time": 1.1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0159199143524915,
												"dt": -0.10745867803961562
											},
											"nextHandle": {
												"dv": 0.015814814814814948,
												"dt": 0.10603952401436856
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": true,
								"wrap": true,
								"progress": 0.79,
								"saturation": 1,
								"width": 0.12,
								"uvScaleX": 0.14,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/T_Square03.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "width",
									"keys": [
										{
											"time": 0.23162432255816806,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.4876546432596329,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.569,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.091,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.395,
											"value": 0,
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
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.33,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 0.98,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/uGrad.png",
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
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": false,
								"wrap": true,
								"progress": 0.93,
								"saturation": 1,
								"width": 0.11,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/Cyl15u_A.png",
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
					"type": "object",
					"name": "ArmR_test",
					"enabled": false,
					"x": 0.3212666666666666,
					"y": -0.5262399999999999,
					"z": 2.47356,
					"children": [
						{
							"type": "model",
							"name": "Knees2",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.32126666666666653,
							"y": 0.5262399999999998,
							"z": -2.47356,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationZ": -122.73,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4419804799989486,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5669999100405388,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.6339574308545393,
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4419804799989486,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5669999100405388,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.6339574308545393,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.33735070219389107,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.5675963085463558,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "width",
											"keys": [
												{
													"time": 0.5689750247520591,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.825005345453524,
													"value": 0,
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.4835702539459661,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4935702539459661,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5096735450653987,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.519673545065399,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Knees1",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.32126666666666653,
							"y": 0.5262399999999998,
							"z": -2.47356,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationZ": -122.73,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.10462977780505756,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22964920784664777,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.2966067286606482,
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.10462977780505756,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22964920784664777,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.2966067286606482,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.2302456063524647,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "width",
											"keys": [
												{
													"time": 0.23162432255816806,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4876546432596329,
													"value": 0,
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.14621955175207502,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.15621955175207503,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.17232284287150768,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.1823228428715079,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Knees3",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"x": -0.32126666666666653,
							"y": 0.5262399999999998,
							"z": -2.47356,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationZ": -122.73,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9136038868342806,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.071712505812752,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 1.2034696882948113,
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.07901301043185005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9136038868342806,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.071712505812752,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 1.2034696882948113,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.8169946214411433,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 1.1000066696339144,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "width",
											"keys": [
												{
													"time": 1.0914760831850607,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.394517602893796,
													"value": 0,
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.9882828497181791,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9982828497181792,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0143861408376118,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.024386140837612,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "ArmL_test",
					"enabled": false,
					"x": 0.4934200000000001,
					"y": 1.10332,
					"z": 3.70884,
					"children": [
						{
							"type": "model",
							"name": "Knees1",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"enabled": false,
							"x": -0.49341999999999997,
							"y": -1.1033199999999999,
							"z": -3.7088399999999995,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationZ": -122.73,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22103623810115458,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3460556681427448,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.4130131889567452,
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.22103623810115458,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3460556681427448,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.4130131889567452,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.11640646029609703,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.34665206664856174,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "width",
											"keys": [
												{
													"time": 0.3480307828542651,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.60406110355573,
													"value": 0,
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.12932183977360934,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.13932183977360935,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.155425130893042,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.16542513089304223,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Knees2",
							"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
							"enabled": false,
							"x": -0.49341999999999997,
							"y": -1.1033199999999999,
							"z": -3.7088399999999995,
							"scaleX": 0.4999999999999999,
							"scaleY": 0.4999999999999999,
							"scaleZ": 0.5,
							"rotationZ": -122.73,
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
											"emissive": 0.1
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
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2.27,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.18,
										"vOffset": 0,
										"texture": "Fx/Gradients/T_Square03.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5445986668981806,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6696180969397708,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.7365756177537712,
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": false,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": -0.08,
										"vOffset": 0,
										"texture": "Fx/Gradients/uGrad.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": -0.04547237692926176,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5445986668981806,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6696180969397708,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.050279752395452515
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
													}
												},
												{
													"time": 0.7365756177537712,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.041899793662877126
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.041899793662877126
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
											0.9921568627450981,
											0.8235294117647058,
											0.6627450980392157
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.52,
										"saturation": 1,
										"width": 0.15,
										"uvScaleX": 0.14,
										"uvScaleY": 0.73,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.53,
										"scaleY": 1,
										"shiftX": 1,
										"shiftY": 1,
										"shiftSpeedX": 0,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.43996888909312304,
													"value": 0.05111111111111105,
													"mode": 0,
													"prevHandle": {
														"dv": 4.082155997157844e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.07999999999999996
													}
												},
												{
													"time": 0.6702144954455878,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.10833333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.10833333333333332
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.79,
										"saturation": 1,
										"width": 0.12,
										"uvScaleX": 0.14,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/T_Square03.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "width",
											"keys": [
												{
													"time": 0.671593211651291,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.927623532352756,
													"value": 0,
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
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.98,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.93,
										"saturation": 1,
										"width": 0.11,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl15u_A.png",
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.45288426857063535,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.46288426857063536,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.478987559690068,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.48898755969006824,
													"value": 0,
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