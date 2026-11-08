{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.08361,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
			"rotationZ": 210,
			"children": [
				{
					"type": "object",
					"name": "TESTSDECALS",
					"editorOnly": true,
					"locked": true,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": -9.11913,
							"y": -7.14714,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": -25.2,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.36755,
									"y": -0.18432,
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 4,
									"rotationZ": 159.4,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"type": "advancedDecal",
									"name": "Decal_tour",
									"x": 0.64773,
									"y": 1.28361,
									"z": 0.75656,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": 10.72591,
							"y": -3.27284,
							"z": 1.90713,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 61.4,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.5666,
									"y": -1.16683,
									"z": -0.19,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.41394,
									"y": -0.66683,
									"z": -0.19293,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 2.419999999999999,
									"rotationZ": 17.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.95,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.15,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": -0.81369,
							"y": 12.34346,
							"z": 4.62925,
							"scaleX": 8.2,
							"scaleY": 8.2,
							"scaleZ": 8.2,
							"rotationZ": 150.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.20787,
									"y": -0.67384,
									"z": -0.3,
									"scaleX": 4,
									"scaleY": 5,
									"scaleZ": 1.73,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.4793,
									"y": 0.50076,
									"z": -0.3,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 1.56,
									"rotationZ": -14,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.75
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "CorinoBase_mesh",
					"editorOnly": true,
					"locked": true,
					"children": [
						{
							"type": "model",
							"name": "District_1_3",
							"source": "Structure/Base/Corrino/CorrinoBase_District_01.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "District_2_2",
							"source": "Structure/Base/Corrino/CorrinoBase_District_02.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "District_3_1",
							"source": "Structure/Base/Corrino/CorrinoBase_District_03.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "CorrinoBase",
							"source": "Structure/Base/Corrino/CorrinoBase.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"rotationZ": -150.00000000000003,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"time": -0.1,
									"animation": "Structure/Base/Corrino/Anim_CorrinoBase.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LightDecals",
					"locked": true,
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosionAnticipation",
							"x": 2.45221,
							"y": -3.90778,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 40,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.5
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.0003897285461431643,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.010389728546142951,
													"value": 1.5,
													"mode": 2
												},
												{
													"time": 0.435,
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
											0.4666666666666667,
											0.8352941176470589,
											1
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.01,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.5274218750000008,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.5374218750000006,
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
					"name": "BigElec",
					"x": -1.23294,
					"y": 0.95169,
					"z": -0.7437,
					"scaleX": 0.9,
					"scaleY": 0.9,
					"scaleZ": 0.9,
					"rotationZ": -149.2,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"emitRate": 1,
								"maxCount": 1,
								"frameCount": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
								"instScale_rand": 0,
								"emitType": "Burst",
								"enableSort": false,
								"animationSpeed": 0.7,
								"lifeTime": 0.15,
								"burstDelay": 2.2
							},
							"x": -1.46677,
							"y": 7.48652,
							"z": 0.88016,
							"scaleX": 0.1,
							"scaleY": 0.09999999999999998,
							"scaleZ": 0.09999999999999999,
							"rotationX": -0.5,
							"rotationY": 6.4,
							"rotationZ": -155.4,
							"children": [
								{
									"type": "model",
									"name": "Mesh_ElectricityBig",
									"source": "Fx/Structure/CorrinoBase/Mesh_ElectricityBig02.fbx",
									"rotationX": 90,
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
													"depthTest": "Less",
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.36,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_03.png",
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.33725490196078434,
											0.5137254901960784,
											0.996078431372549
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"emitRate": 1,
								"maxCount": 1,
								"frameCount": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
								"instScale_rand": 0,
								"emitType": "Burst",
								"enableSort": false,
								"animationSpeed": 0.7,
								"lifeTime": 0.15,
								"instScale": 1.2,
								"burstDelay": 2.2,
								"warmUpTime": -0.1
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Mesh_ElectricityBig",
									"source": "Fx/Structure/CorrinoBase/Mesh_ElectricityBig02.fbx",
									"rotationX": 90,
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
													"depthTest": "Less",
													"emissive": 10
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
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
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_03.png",
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
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.33725490196078434,
											0.5137254901960784,
											0.996078431372549
										]
									},
									"isInstance": true
								}
							]
						}
					]
				}
			]
		}
	]
}