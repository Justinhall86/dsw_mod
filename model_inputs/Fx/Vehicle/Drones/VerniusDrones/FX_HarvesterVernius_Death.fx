{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Harvester",
					"source": "Vehicle/Vernius/Harvester/Harvester.fbx",
					"editorOnly": true,
					"z": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/HarvesterVernius/Anim_HarvesterVernius_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Death",
					"y": -0.2907,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "object",
							"name": "Explosions",
							"y": 0.49192,
							"children": [
								{
									"type": "object",
									"name": "Big Explosion",
									"y": 0.39456,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"children": [
										{
											"type": "object",
											"name": "Explo1",
											"x": -1.02278,
											"y": 0.31903,
											"z": -0.10824,
											"scaleX": 0.45,
											"scaleY": 0.45,
											"scaleZ": 0.45,
											"rotationX": -78.9,
											"rotationY": -8.4,
											"rotationZ": 41.5,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
													"x": 0.095,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555,
													"time": -0.1
												}
											]
										},
										{
											"type": "object",
											"name": "Explo1",
											"x": -1.08841,
											"y": 0.4085,
											"z": -0.67603,
											"scaleX": 0.6,
											"scaleY": 0.6,
											"scaleZ": 0.6,
											"rotationX": -78.9,
											"rotationY": -8.4,
											"rotationZ": 41.5,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
													"x": 0.095,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555
												}
											]
										},
										{
											"type": "object",
											"name": "Explo1",
											"x": -1.14073,
											"y": 0.37003,
											"z": -1.28217,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
											"rotationX": -78.9,
											"rotationY": -8.4,
											"rotationZ": 41.5,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
													"x": 0.095,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555,
													"time": 0.1
												}
											]
										},
										{
											"type": "object",
											"name": "ExploBOTTOM",
											"x": 0.01789,
											"y": -0.25868,
											"z": 0.14385,
											"scaleX": 0.7,
											"scaleY": 0.7,
											"scaleZ": 0.7,
											"rotationX": 88.5,
											"rotationY": 4.4,
											"rotationZ": -21.9,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_trails_Base_Noflare",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
													"scaleX": 0.30000000000000004,
													"scaleY": 0.2999999999999998,
													"scaleZ": 0.4499999999999999,
													"time": -0.1
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
													"x": 0.095,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555,
													"time": -0.25
												}
											]
										},
										{
											"type": "object",
											"name": "ExploTOP",
											"x": 0.31384,
											"y": 0.36615,
											"z": 0.03733,
											"scaleX": 0.9,
											"scaleY": 0.9,
											"scaleZ": 0.9,
											"rotationX": -89.7,
											"rotationY": -0.2,
											"rotationZ": -18.2,
											"children": [
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_trails_Base_Noflare",
													"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
													"scaleX": 0.35,
													"scaleY": 0.35,
													"scaleZ": 0.53,
													"time": -0.1
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
													"x": -0.18572,
													"z": -0.12245,
													"scaleX": 0.8680555555555555,
													"scaleY": 0.8680555555555558,
													"scaleZ": 0.8680555555555555,
													"time": -0.25
												},
												{
													"type": "subFX",
													"name": "FX_Directional_Explosion_Low_Local",
													"source": "Fx/Explosion/FX_Directional_Explosion_Low_Local.fx",
													"x": 0.095,
													"y": 0.98237,
													"scaleX": 0.5,
													"scaleY": 0.5,
													"scaleZ": 0.5,
													"time": -0.1
												}
											]
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
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						},
						{
							"type": "object",
							"name": "LightDecals",
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"enabled": false,
									"x": 1.00485,
									"y": 0.87971,
									"z": 1.83402,
									"scaleX": 2,
									"scaleY": 3,
									"scaleZ": 1.5,
									"rotationX": 93,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
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
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.2572964092365825,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3077132102392084,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8172212022175404,
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.11086060241340401,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.12321030088110385,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9424069659052015,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9506400982170014,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": -0.23488,
									"y": 0.26562,
									"z": 0.28498,
									"scaleX": 4,
									"scaleY": 4,
									"rotationX": 93,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
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
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.13594467809633282,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.17344665826083847,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7863959535241067,
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.09311388978278767,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.1054577635430692,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8113163669300235,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8236602406903051,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 0.36814,
									"y": 1.86006,
									"z": -0.04641,
									"scaleX": 4,
									"scaleY": 4,
									"rotationX": 93,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
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
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.13594467809633282,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.17344665826083847,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7863959535241067,
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0.09311388978278767,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.1054577635430692,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8113163669300235,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8236602406903051,
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
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Harvester.root.JNT_Root"
				}
			]
		}
	]
}