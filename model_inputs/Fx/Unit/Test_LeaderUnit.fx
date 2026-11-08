{
	"type": "fx",
	"cullingRadius": 4,
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
			"rotationZ": 90,
			"children": [
				{
					"type": "model",
					"name": "Reference",
					"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
					"x": -20.58984,
					"y": -0.69068,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Anim_Male01_AttackMelee02.fbx",
							"duration": 1000
						}
					]
				},
				{
					"type": "object",
					"name": "Test01",
					"children": [
						{
							"type": "model",
							"name": "Leader",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"scaleX": 2.3,
							"scaleY": 2.3,
							"scaleZ": 2.3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Anim_Male01_AttackMelee03.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 4
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0,
												"scale": 1.91,
												"power": 2,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": -0.36749,
							"scaleX": 18,
							"scaleY": 18,
							"scaleZ": 1.5,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 1.8,
							"fadeStart": 0.08,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.6
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
											0.6745098039215687,
											0.3333333333333333
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Test04",
					"x": -13.06731,
					"y": -1.50338,
					"children": [
						{
							"type": "model",
							"name": "Leader",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"scaleX": 2.3,
							"scaleY": 2.3,
							"scaleZ": 2.3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Anim_Male01_AttackMelee03.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 4
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0,
												"scale": 1.91,
												"power": 2,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "Circle",
							"z": 0.2,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 35,
							"rotationZ": -163.6,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"drawOrder": "100",
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
										"useSourceUVs": true,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/FloorScan_Round_08.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 1,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
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
										"envBlend": 0.9,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "BigCircle",
							"z": 0.2,
							"scaleX": 6,
							"scaleY": 6,
							"scaleZ": 35,
							"rotationZ": 163.6,
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
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"drawOrder": "100"
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
										"alpha": 3,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_LensFlare_02.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 1,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.16666666666666666
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
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
										"envBlend": 0.9,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3,
											"value": -1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": -0.36749,
							"scaleX": 18,
							"scaleY": 18,
							"scaleZ": 1.5,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 1.8,
							"fadeStart": 0.08,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.3
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
											0.6745098039215687,
											0.3333333333333333
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Test05",
					"x": -5.55462,
					"y": -0.58992,
					"children": [
						{
							"type": "model",
							"name": "Leader",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"scaleX": 2.3,
							"scaleY": 2.3,
							"scaleZ": 2.3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Anim_Male01_AttackMelee03.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 4
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0,
												"scale": 1.91,
												"power": 2,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "swarmMesh04",
							"source": "Fx/Unit/swarmMesh04.fbx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationX": 24.4,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Front",
											"colorMask": 255,
											"emissive": 7,
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
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1.5,
										"uScale": 0.8,
										"vScale": 0.8,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl06u_A.png"
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
										"progress": 0.27,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 10,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_03.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"enabled": false,
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.17,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 10,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.75,
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
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationY": -24.39684131828383,
							"rotationZ": 114.34455221735575,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationX": 103.64,
									"rotationZ": 113.9418842024763,
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
													"colorMask": 255
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle.png"
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
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Test05.swarmMesh04",
							"target": "FXAnimation.FXRoot.Test05.Leader.root.B_ROOTJ.B_Spine01J"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Test05.lookAt",
							"target": "FXAnimation.FXRoot.Test05.Leader.root.B_ROOTJ.B_Spine01J"
						}
					]
				},
				{
					"type": "object",
					"name": "Test02",
					"x": 7.34073,
					"children": [
						{
							"type": "model",
							"name": "Leader",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"scaleX": 2.3,
							"scaleY": 2.3,
							"scaleZ": 2.3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Anim_Male01_AttackMelee02.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 4
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0,
												"scale": 1.91,
												"power": 2,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.00472,
							"y": 0.55891,
							"z": -0.02444,
							"scaleX": 0.75,
							"scaleY": 0.15,
							"scaleZ": 0.45,
							"rotationX": -106.4,
							"rotationY": -54.3,
							"rotationZ": 23.2,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"scaleX": 9,
									"scaleY": 8,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.15,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
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
														"width": 0.23,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.08,
															0.5
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
														"progress": 0.36,
														"saturation": 0,
														"width": 0.72,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.02
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
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
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt2",
							"x": -0.01423,
							"y": 0.47775,
							"z": -0.00109,
							"scaleX": 0.65,
							"scaleY": 0.3,
							"scaleZ": 0.55,
							"rotationX": -81.8,
							"rotationY": -174.4,
							"rotationZ": -11.6,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"scaleX": 9,
									"scaleY": 8,
									"rotationX": 90,
									"rotationZ": 90,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"enabled": false,
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.15,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
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
														"width": 0.23,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.08,
															0.05
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
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.36,
														"saturation": 0,
														"width": 0.72,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.02
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
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
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Test02.lookAt",
							"target": "FXAnimation.FXRoot.Test02.Leader.root.B_ROOTJ.B_Spine01J"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Test02.lookAt2",
							"target": "FXAnimation.FXRoot.Test02.Leader.root.B_ROOTJ.B_Spine01J"
						}
					]
				},
				{
					"type": "object",
					"name": "Test03",
					"x": 14.53945,
					"children": [
						{
							"type": "model",
							"name": "Leader",
							"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
							"scaleX": 2.3,
							"scaleY": 2.3,
							"scaleZ": 2.3,
							"rotationZ": 145,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Anim_Male01_AttackMelee02.fbx",
									"duration": 1000
								},
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "Alpha",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false,
											"depthWrite": "On",
											"emissive": 4
										}
									},
									"children": [
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": true,
												"ALPHA": false,
												"REVERSE": false,
												"bias": 0,
												"scale": 1.91,
												"power": 2,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"x": 0.01913,
							"y": 0.47505,
							"z": -0.01025,
							"scaleX": 0.65,
							"scaleY": 0.15,
							"scaleZ": 0.4,
							"rotationX": -81.8,
							"rotationY": -174.4,
							"rotationZ": -11.5,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"z": 0.37765,
									"scaleX": 9,
									"scaleY": 10,
									"rotationX": 90,
									"rotationZ": 90,
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
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_01.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 1,
														"shiftY": 0.77,
														"shiftSpeedX": -0.15,
														"shiftSpeedY": 0
													},
													"recursiveApply": false,
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
														"width": 0.23,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.08,
															0.5
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
														"progress": 0.36,
														"saturation": 0,
														"width": 0.72,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.01,
															0.02
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
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
												"texture": "Fx/Gradients/GradientSpice_2.png"
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt2",
							"x": -0.01423,
							"y": 0.47775,
							"z": -0.00109,
							"scaleX": 0.65,
							"scaleY": 0.4,
							"scaleZ": 0.55,
							"rotationX": -81.8,
							"rotationY": -174.4,
							"rotationZ": -11.6,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"y": -0.04318,
									"z": 2.78846,
									"scaleX": 4,
									"scaleY": 30,
									"rotationX": 90,
									"rotationZ": 90,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"alpha": 0.9,
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
															0.2
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
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
												"alpha": 0.6,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt3",
							"x": -0.00448,
							"y": -0.03846,
							"z": 0.0792,
							"scaleX": 0.4,
							"scaleY": 0.45,
							"scaleZ": 0.35,
							"rotationX": -116,
							"rotationY": -61.6,
							"rotationZ": 31.3,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "model",
									"name": "Feu_2",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"y": -0.04318,
									"z": 2.78846,
									"scaleX": 5,
									"scaleY": 30,
									"rotationX": 90,
									"rotationZ": 90,
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
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"alpha": 0.8,
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
															0.2
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
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.5
													},
													"isInstance": true
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
							"object": "FXAnimation.FXRoot.Test03.lookAt",
							"target": "FXAnimation.FXRoot.Test03.Leader.root.B_ROOTJ.B_Spine01J"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Test03.lookAt2",
							"target": "FXAnimation.FXRoot.Test03.Leader.root.B_ROOTJ.B_Spine01J"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Test03.lookAt3",
							"target": "FXAnimation.FXRoot.Test03.Leader.root.B_ROOTJ.B_Spine01J"
						}
					]
				}
			]
		}
	]
}