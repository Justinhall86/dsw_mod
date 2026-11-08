{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"rotationZ": 210,
			"children": [
				{
					"type": "object",
					"name": "CorinoBase_mesh",
					"editorOnly": true,
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
					"name": "TESTSDECALS",
					"editorOnly": true,
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
					"name": "right",
					"x": 5.7091660000000015,
					"y": 16.632044,
					"z": 4.24325,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": -13.552346000000004,
							"y": 8.026396000000002,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": 78.29999999999998,
							"rotationY": 54.39999999999999,
							"rotationZ": -126,
							"time": 0.385
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": -5.3933060000000035,
							"y": 4.555676000000002,
							"rotationX": -101.70000000000003,
							"rotationY": 125.59999999999997,
							"rotationZ": -39.50000000000001,
							"time": 0.365
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": 2.458613999999998,
							"y": -0.6620239999999988,
							"scaleX": 2.0000000000000004,
							"scaleY": 2.0000000000000004,
							"scaleZ": 2.0000000000000004,
							"rotationX": 78.29999999999998,
							"rotationY": 54.39999999999999,
							"rotationZ": 136.6,
							"time": 0.33
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": 6.145163999999997,
							"y": -3.494924000000001,
							"scaleX": 0.8000000000000003,
							"scaleY": 0.8,
							"scaleZ": 0.8000000000000003,
							"rotationX": 78.29999999999998,
							"rotationY": 54.4,
							"rotationZ": 121.7,
							"time": 0.24318
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": 10.341873999999997,
							"y": -8.425123999999997,
							"scaleX": 1.4,
							"scaleY": 1.4,
							"scaleZ": 1.4,
							"rotationX": 78.29999999999998,
							"rotationY": 54.39999999999999,
							"rotationZ": 71.69999999999999,
							"time": 0.13168
						}
					]
				},
				{
					"type": "object",
					"name": "left",
					"x": -15.499492,
					"y": -1.8127279999999981,
					"z": 4.24325,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": -2.017718000000002,
							"y": 13.921207999999998,
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 78.29999999999998,
							"rotationY": 54.4,
							"rotationZ": -88.40000000000003,
							"time": 0.38544
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": -1.0183180000000007,
							"y": 5.653127999999997,
							"scaleX": 1.2000000000000002,
							"scaleY": 1.2000000000000004,
							"scaleZ": 1.2000000000000002,
							"rotationX": 78.29999999999998,
							"rotationY": 54.4,
							"rotationZ": -88.40000000000003,
							"time": 0.37
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": -0.4755780000000023,
							"y": -1.095442000000003,
							"scaleX": 0.8000000000000002,
							"scaleY": 0.8000000000000003,
							"scaleZ": 0.8000000000000003,
							"rotationX": 78.29999999999998,
							"rotationY": 54.4,
							"rotationZ": -88.40000000000003,
							"time": 0.33
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": 0.5028719999999982,
							"y": -7.451582000000004,
							"scaleX": 2.0000000000000004,
							"scaleY": 2.0000000000000004,
							"scaleZ": 2.0000000000000004,
							"rotationX": 78.29999999999998,
							"rotationY": 54.4,
							"rotationZ": -88.40000000000003,
							"time": 0.24222
						},
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": 3.008742,
							"y": -11.027312000000002,
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000002,
							"rotationX": 78.30000000000001,
							"rotationY": 54.4,
							"rotationZ": -25.600000000000005,
							"time": 0.13
						}
					]
				}
			]
		}
	]
}