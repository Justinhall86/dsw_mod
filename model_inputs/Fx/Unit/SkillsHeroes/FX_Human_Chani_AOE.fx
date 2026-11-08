{
	"type": "fx",
	"cullingRadius": 500,
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
			"scaleX": 2.5,
			"scaleY": 2.5,
			"scaleZ": 2.5,
			"children": [
				{
					"type": "object",
					"name": "Chani",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_FremenChani",
							"source": "Character/Fremen/Unit/Chani/Female01_FremenChani.fbx",
							"scaleX": 1.99,
							"scaleY": 1.99,
							"scaleZ": 1.99,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Chani/Anim_Female01_Chani_FightIdle.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Crysknife",
							"source": "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
							"x": -0.00275,
							"y": -0.11773,
							"z": 0.01896,
							"rotationX": -90
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "Crysknife",
							"target": "Female01_FremenChani.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "curve",
							"name": "visibility",
							"enabled": false,
							"keys": [
								{
									"time": 0.5671840583079126,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.5771840583079126,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.6820567789778692,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.6920567789778692,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.8371863149409321,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.8471863149409321,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.227702202160165,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.237702202160165,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal_inside",
					"scaleX": 45,
					"scaleY": 45,
					"scaleZ": 39.71,
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
									"emissive": 2
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.4
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
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0.3568627450980392,
									0.20392156862745098,
									0.615686274509804
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
									0.9921568627450981,
									0.6549019607843137,
									0.2627450980392157
								]
							}
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.8,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				}
			]
		}
	]
}