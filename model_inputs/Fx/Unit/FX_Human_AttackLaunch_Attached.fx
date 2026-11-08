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
					"name": "Male01_HeavyWeaponSquad",
					"source": "Character/Atreide/Unit/HeavyWeaponSquad/Male01_HeavyWeaponSquad.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Female01/Anim_Female01_AttackLaunch.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "GRENADE",
					"children": [
						{
							"type": "model",
							"name": "GrenadeMesh",
							"source": "Fx/Meshes_Common/Sphere.fbx",
							"x": 0.03,
							"y": -0.08,
							"scaleX": 0.21,
							"scaleY": 0.21,
							"scaleZ": 0.21,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"color": [
										0.29411764705882354,
										0.5176470588235293,
										0.38823529411764707,
										1
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1349999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.1449999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.1549999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.17,
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
					"type": "object",
					"name": "LIGHT",
					"children": [
						{
							"type": "emitter",
							"name": "LightGrenadeStart_Halo",
							"props": {
								"lifeTime": 0.04,
								"emitType": "Burst",
								"burstCount": 2,
								"burstDelay": 0.5,
								"alignMode": "Screen",
								"instScale_rand": 0.1,
								"warmUpTime": -0.25,
								"maxCount": 2,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.2,
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
												"alpha": 1.2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle2.png",
												"onDecal": false
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
													0.2901960784313725,
													0.13725490196078433
												]
											},
											"isInstance": true
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
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.GrenadeMesh",
					"target": "FXAnimation.FXRoot.Male01_HeavyWeaponSquad.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rPalmJ.B_rFinger2J1"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.GrenadeEmitter",
					"target": "FXAnimation.FXRoot.Male01_HeavyWeaponSquad.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rPalmJ.B_rFinger2J1"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.LightGrenadeStart",
					"target": "FXAnimation.FXRoot.Male01_HeavyWeaponSquad.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rPalmJ.B_rFinger2J1"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Flare_LightGrenadeStart",
					"target": "FXAnimation.FXRoot.Male01_HeavyWeaponSquad.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rPalmJ.B_rFinger2J1"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.LightGrenadeStart_Halo",
					"target": "FXAnimation.FXRoot.Male01_HeavyWeaponSquad.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rPalmJ.B_rFinger2J1"
				}
			]
		}
	]
}