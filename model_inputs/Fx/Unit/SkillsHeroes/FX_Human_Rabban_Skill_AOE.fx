{
	"type": "fx",
	"cullingRadius": 30,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 150,
			"scaleY": 150,
			"scaleZ": 150,
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
			"scaleX": 2.4,
			"scaleY": 2.4,
			"scaleZ": 2.4,
			"children": [
				{
					"type": "object",
					"name": "NEFUD",
					"children": [
						{
							"type": "object",
							"name": "Nefud",
							"editorOnly": true,
							"x": -0.4437056818181817,
							"y": -0.03216431818181819,
							"z": -0.1466197727272727,
							"children": [
								{
									"type": "model",
									"name": "Male01_HarkonnenNefud",
									"source": "Character/Harkonnen/Unit/Nefud/Male01_HarkonnenNefud.fbx",
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Nefud/Anim_Male01_Nefud_FightIdle.fbx"
										}
									]
								},
								{
									"type": "model",
									"name": "NefudMace",
									"source": "Character/Harkonnen/Weapon/NefudMace.fbx",
									"y": 0.16031,
									"rotationX": -90
								},
								{
									"type": "model",
									"name": "NefudShield",
									"source": "Character/Harkonnen/Weapon/NefudShield.fbx",
									"rotationX": -90
								},
								{
									"type": "constraint",
									"name": "constraint",
									"object": "FXAnimation.FXRoot.Nefud.NefudMace",
									"target": "FXAnimation.FXRoot.Nefud.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
								},
								{
									"type": "constraint",
									"name": "constraint",
									"object": "FXAnimation.FXRoot.Nefud.NefudShield",
									"target": "FXAnimation.FXRoot.Nefud.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"scaleX": 2.75,
							"scaleY": 2.75,
							"scaleZ": 2.75,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_inside",
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 15,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_nograd_512.png",
									"renderMode": "BeforeTonemapping",
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
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1.5
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
															"time": 0.18807521815110306,
															"value": 0.5,
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.78,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle4.png",
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
													0.7529411764705882,
													0.27058823529411763,
													0.16078431372549018
												]
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.75,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.8862745098039215,
													0.2392156862745098,
													0.09019607843137255
												]
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