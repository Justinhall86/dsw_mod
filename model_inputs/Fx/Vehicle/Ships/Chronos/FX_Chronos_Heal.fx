{
	"type": "fx",
	"cullingRadius": 20,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 10,
			"scaleX": 3,
			"scaleY": 3,
			"scaleZ": 3,
			"children": [
				{
					"type": "object",
					"name": "Heal",
					"y": -0.1,
					"z": -3.58878,
					"children": [
						{
							"type": "advancedDecal",
							"name": "TestVertical",
							"scaleX": 6,
							"scaleY": 10,
							"scaleZ": 6,
							"rotationX": -90,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"albedoStrength": 3,
							"emissive": 70,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8784313725490196,
											1,
											0.8117647058823529
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
										"progress": 0.36,
										"saturation": 0.59,
										"width": 0.9,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_Scan_testHorizontal.png",
										"uvShift": [
											0,
											-0.2
										],
										"uvShiftSpeed": [
											0,
											0.25
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1.25
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.4,
													"mode": 2
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4,
													"value": 0.4,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "TestHorizontal",
							"enabled": false,
							"scaleX": 6,
							"scaleY": 10,
							"scaleZ": 6,
							"rotationX": -90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"albedoStrength": 3,
							"emissive": 70,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8784313725490196,
											1,
											0.8117647058823529
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
										"progress": 0.36,
										"saturation": 0.59,
										"width": 0.9,
										"uvScaleX": 4,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_Scan_testHorizontal_NoStars.png",
										"uvShift": [
											0,
											-0.2
										],
										"uvShiftSpeed": [
											-0.15,
											0.1
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.2
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.4,
													"mode": 2
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4,
													"value": 0.4,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FakeFresnel",
							"y": 0.74449,
							"z": 0.39777,
							"scaleX": 6,
							"scaleY": 10,
							"scaleZ": 4,
							"rotationX": -90,
							"albedoMap": "Fx/Gradients/circGrad01_invert.png",
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.3,
													"mode": 2
												},
												{
													"time": 2,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4,
													"value": 0.3,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": -6.938893903907228e-18,
													"value": 0.033333333333333354,
													"mode": 2
												},
												{
													"time": 0.7,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4410989067285844,
													"value": 0.04999999999999999,
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
											0.8784313725490196,
											1,
											0.8117647058823529
										]
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"enabled": false,
									"keys": [
										{
											"time": 4.3449451135381025,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.354945113538102,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.558987084873465,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8.568987084873463,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Cronos_Heal",
							"source": "Fx/Meshes_Common/Cronos_Heal.fbx",
							"y": 0.30891,
							"z": 0.21159,
							"scaleX": 0.75,
							"scaleZ": 0.6,
							"rotationX": 90,
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
											"colorMask": 255,
											"emissive": 3
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 2,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
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
										"progress": 0.1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 5,
										"texture": "Fx/Gradients/Cyl11u_A.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.5
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
											0.9450980392156862,
											1,
											0.8117647058823529
										]
									}
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": true,
										"bias": 0.2,
										"scale": 1,
										"power": 1,
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
											"time": 0.40545730590820295,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.4023345375061043,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -1.0237796974182136
											},
											"nextHandle": {
												"dv": 0.010852497436949542,
												"dt": 0.3333169962669705
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "Chronos",
					"source": "Vehicle/Imperial/Chronos/Chronos.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Chronos/Anim_Chronos_Idle.fbx"
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"enabled": false,
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.36,
								"scale": 0.17,
								"power": 0.25,
								"color": [
									0.8784313725490196,
									1,
									0.8117647058823529
								]
							}
						}
					]
				},
				{
					"type": "model",
					"name": "Chronos",
					"source": "Vehicle/Imperial/Chronos/Chronos.fbx",
					"enabled": false,
					"y": -11.09446,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Chronos/Anim_Chronos_Idle.fbx"
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"enabled": false,
							"props": {
								"RGB": true,
								"ALPHA": false,
								"REVERSE": true,
								"bias": 0.36,
								"scale": 0.17,
								"power": 0.25,
								"color": [
									0.8784313725490196,
									1,
									0.8117647058823529
								]
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Heal",
					"target": "FXAnimation.FXRoot.Chronos.root.B_ROOT.B_Body"
				}
			]
		}
	]
}