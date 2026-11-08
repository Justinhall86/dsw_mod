{
	"type": "fx",
	"cullingRadius": 20,
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
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_EcazIlesa",
							"source": "Character/Ecaz/Unit/Ilesa/Female01_EcazIlesa.fbx",
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Ilesa/Anim_Female01_Ilesa_FightIdle.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "GunIlesa",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.22599,
							"y": -0.1778,
							"z": 0.19309,
							"rotationX": -87.4,
							"rotationY": -55.1,
							"rotationZ": 33.1
						},
						{
							"type": "model",
							"name": "GunIlesa1",
							"source": "Character/Ecaz/Weapon/GunIlesa/GunIlesa.fbx",
							"x": -0.31384,
							"y": -0.13991,
							"z": -0.05788,
							"rotationX": -29.1,
							"rotationY": -108.4,
							"rotationZ": -46.9
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.Chara.GunIlesa",
							"target": ".FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_rThumbJ1"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.Chara.GunIlesa1",
							"target": ".FXRoot.Chara.Female01_EcazIlesa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lThumbJ1"
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
							}
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
							"emissive": 1,
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
											"emissive": 3
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											0.792156862745098,
											0.24705882352941178,
											0.40784313725490196
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