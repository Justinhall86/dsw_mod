{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Harpy",
					"source": "Vehicle/Harkonnen/Harpy/Harpy.fbx",
					"editorOnly": true,
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Harpy/Anim_Harpy_Run.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Reactor",
					"y": 0.12018,
					"z": -1.07509,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"rotationX": 90,
					"rotationY": -90,
					"children": [
						{
							"type": "model",
							"name": "CylinderCone_StraightUV_01",
							"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
							"x": 2.34496,
							"y": 0.00521,
							"z": -0.46113,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 7.5,
							"rotationY": 115.9,
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
											"emissive": 1
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
										"invert": true,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"onDecal": false
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
										"progress": 0.95,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
									"isInstance": true
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
									"name": "rotation.y",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.19428162574768085
											}
										},
										{
											"time": 1,
											"value": 0.06819444444444442,
											"mode": 0,
											"prevHandle": {
												"dv": 2.945820582227334e-18,
												"dt": -0.31625898884873627
											},
											"nextHandle": {
												"dv": -0.00008566337719297101,
												"dt": 0.3924924349784866
											}
										},
										{
											"time": 1.6857142857142857,
											"value": 0.02231734006734005,
											"mode": 2
										},
										{
											"time": 2.057142857142857,
											"value": -0.008717171717171726,
											"mode": 2
										},
										{
											"time": 2.4285714285714284,
											"value": -0.0464983164983165,
											"mode": 2
										},
										{
											"time": 3.011403486728668,
											"value": -0.08023148148148147,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.2469475245475762
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.136969861984254
											}
										},
										{
											"time": 3.8285714285714287,
											"value": -0.022210437710437715,
											"mode": 0,
											"prevHandle": {
												"dv": -0.013246464992585234,
												"dt": -0.14692248337352484
											},
											"nextHandle": {
												"dv": 0.02833585858585858,
												"dt": 0.3142857142857145
											}
										},
										{
											"time": 5.018801214694982,
											"value": 0.06541666666666664,
											"mode": 0,
											"prevHandle": {
												"dv": 6.1895907671395486e-18,
												"dt": -0.6645054112300866
											},
											"nextHandle": {
												"dv": 0.00032525313527953514,
												"dt": 0.6385952568054201
											}
										},
										{
											"time": 6.683710277080543,
											"value": -0.07980573449683236,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0027469686255873842,
												"dt": -0.7403805441798604
											},
											"nextHandle": {
												"dv": 0.0017346833881578955,
												"dt": 0.4675429558753974
											}
										},
										{
											"time": 8,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01717679207785088,
												"dt": -0.7119049263000417
											},
											"nextHandle": {
												"dv": 0.01141601048925232,
												"dt": 0.4652897554578961
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
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderCone_StraightUV_01",
							"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_Double_larger.fbx",
							"x": 2.5774,
							"y": -0.28919,
							"z": -0.24644,
							"scaleX": 1.33,
							"scaleY": 1.33,
							"scaleZ": 10,
							"rotationX": 103.3,
							"rotationY": 86.3,
							"rotationZ": 67.2,
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
											"emissive": 1
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
										"invert": true,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"onDecal": false
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
										"progress": 0.95,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
									"isInstance": true
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0,
											0
										]
									}
								},
								{
									"type": "curve",
									"name": "rotation.y",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": -3.552713678800501e-15,
											"value": 0,
											"mode": 0
										},
										{
											"time": -3.552713678800501e-15,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.19428162574768085
											}
										},
										{
											"time": 0.9999999999999964,
											"value": 0.06819444444444442,
											"mode": 0
										},
										{
											"time": 0.9999999999999964,
											"value": 0.06819444444444442,
											"mode": 0,
											"prevHandle": {
												"dv": 2.945820582227334e-18,
												"dt": -0.31625898884873627
											},
											"nextHandle": {
												"dv": -0.00008566337719297101,
												"dt": 0.3924924349784866
											}
										},
										{
											"time": 1.6857142857142824,
											"value": 0.02231734006734005,
											"mode": 2
										},
										{
											"time": 1.6857142857142824,
											"value": 0.02231734006734005,
											"mode": 2
										},
										{
											"time": 2.0571428571428534,
											"value": -0.008717171717171726,
											"mode": 2
										},
										{
											"time": 2.0571428571428534,
											"value": -0.008717171717171726,
											"mode": 2
										},
										{
											"time": 2.428571428571425,
											"value": -0.0464983164983165,
											"mode": 2
										},
										{
											"time": 2.428571428571425,
											"value": -0.0464983164983165,
											"mode": 2
										},
										{
											"time": 3.0114034867286645,
											"value": -0.08023148148148147,
											"mode": 0
										},
										{
											"time": 3.0114034867286645,
											"value": -0.08023148148148147,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.2469475245475762
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.136969861984254
											}
										},
										{
											"time": 3.8285714285714256,
											"value": -0.022210437710437715,
											"mode": 0
										},
										{
											"time": 3.8285714285714256,
											"value": -0.022210437710437715,
											"mode": 0,
											"prevHandle": {
												"dv": -0.013246464992585234,
												"dt": -0.14692248337352484
											},
											"nextHandle": {
												"dv": 0.02833585858585858,
												"dt": 0.3142857142857145
											}
										},
										{
											"time": 5.018801214694978,
											"value": 0.06541666666666664,
											"mode": 0
										},
										{
											"time": 5.018801214694978,
											"value": 0.06541666666666664,
											"mode": 0,
											"prevHandle": {
												"dv": 6.1895907671395486e-18,
												"dt": -0.6645054112300866
											},
											"nextHandle": {
												"dv": 0.00032525313527953514,
												"dt": 0.6385952568054201
											}
										},
										{
											"time": 6.683710277080539,
											"value": -0.07980573449683236,
											"mode": 0
										},
										{
											"time": 6.683710277080539,
											"value": -0.07980573449683236,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0027469686255873842,
												"dt": -0.7403805441798604
											},
											"nextHandle": {
												"dv": 0.0017346833881578955,
												"dt": 0.4675429558753974
											}
										},
										{
											"time": 7.9999999999999964,
											"value": 0,
											"mode": 0
										},
										{
											"time": 7.9999999999999964,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01717679207785088,
												"dt": -0.7119049263000417
											},
											"nextHandle": {
												"dv": 0.01141601048925232,
												"dt": 0.4652897554578961
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "CylinderCone_StraightUV_01",
							"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_larger.fbx",
							"x": 2.53618,
							"y": 0.25835,
							"z": -0.25411,
							"scaleX": 1.33,
							"scaleY": 1.33,
							"scaleZ": 10,
							"rotationX": 29.3,
							"rotationY": 86.3,
							"rotationZ": 67.2,
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
											"emissive": 1
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
										"invert": true,
										"replace": false,
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Gradient_Spotlight.png",
										"onDecal": false
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
										"progress": 0.95,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
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
									"isInstance": true
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
									"name": "rotation.y",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.19428162574768085
											}
										},
										{
											"time": 1,
											"value": 0.06819444444444442,
											"mode": 0,
											"prevHandle": {
												"dv": 2.945820582227334e-18,
												"dt": -0.31625898884873627
											},
											"nextHandle": {
												"dv": -0.00008566337719297101,
												"dt": 0.3924924349784866
											}
										},
										{
											"time": 1.6857142857142857,
											"value": 0.02231734006734005,
											"mode": 2
										},
										{
											"time": 2.057142857142857,
											"value": -0.008717171717171726,
											"mode": 2
										},
										{
											"time": 2.4285714285714284,
											"value": -0.0464983164983165,
											"mode": 2
										},
										{
											"time": 3.011403486728668,
											"value": -0.08023148148148147,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.2469475245475762
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.136969861984254
											}
										},
										{
											"time": 3.8285714285714287,
											"value": -0.022210437710437715,
											"mode": 0,
											"prevHandle": {
												"dv": -0.013246464992585234,
												"dt": -0.14692248337352484
											},
											"nextHandle": {
												"dv": 0.02833585858585858,
												"dt": 0.3142857142857145
											}
										},
										{
											"time": 5.018801214694982,
											"value": 0.06541666666666664,
											"mode": 0,
											"prevHandle": {
												"dv": 6.1895907671395486e-18,
												"dt": -0.6645054112300866
											},
											"nextHandle": {
												"dv": 0.00032525313527953514,
												"dt": 0.6385952568054201
											}
										},
										{
											"time": 6.683710277080543,
											"value": -0.07980573449683236,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0027469686255873842,
												"dt": -0.7403805441798604
											},
											"nextHandle": {
												"dv": 0.0017346833881578955,
												"dt": 0.4675429558753974
											}
										},
										{
											"time": 8,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01717679207785088,
												"dt": -0.7119049263000417
											},
											"nextHandle": {
												"dv": 0.01141601048925232,
												"dt": 0.4652897554578961
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
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Flare",
							"enabled": false,
							"props": {
								"emitRate": 6,
								"maxCount": 6,
								"alignMode": "Screen",
								"instScale": 2.5,
								"lifeTime": 0.3,
								"lifeTimeRand": 0.2,
								"instStretch_rand": [
									0.2,
									0.2,
									0.2
								],
								"instRotation_rand": [
									10,
									10,
									10
								],
								"instScale_rand": 0.2
							},
							"x": 2.47419,
							"y": 0.00521,
							"z": -0.52388,
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.01,
							"rotationY": 115.9,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
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
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"emissive": 2
												}
											},
											"diffuseMap": "Fx/Alphas/T_Flare07.png",
											"color": [
												1,
												0,
												0,
												1
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
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
																"dv": -1.307242267623488,
																"dt": -0.2236067977499791
															},
															"nextHandle": {
																"dv": 0.6666666666666666,
																"dt": 0.11403486728668219
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.6,
																"dt": -0.04210711479186968
															},
															"nextHandle": {
																"dv": -0.6,
																"dt": 0.04210711479186968
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
													1,
													0,
													0
												]
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Reactor",
					"target": "FXAnimation.FXRoot.Harpy.root.B_ROOT.B_Body"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Lights",
					"target": "FXAnimation.FXRoot.Harpy.root.B_ROOT.B_Body"
				},
				{
					"type": "light",
					"name": "light_1",
					"editorOnly": true,
					"y": 2.98887,
					"z": -4.03598,
					"power": 2.42,
					"range": 20,
					"size": 2.05,
					"zNear": 0.02
				}
			]
		}
	]
}