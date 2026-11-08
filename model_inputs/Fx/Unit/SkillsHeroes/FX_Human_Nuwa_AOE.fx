{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.01,
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
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_Nuwa",
							"source": "Character/Vernius/Unit/Nuwa/Female01_Nuwa.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Nuwa/Anim_Female01_Nuwa_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/Female01/Nuwa/Anim_Female01_Nuwa_Skill_Loop.fbx",
									"loop": true
								}
							]
						},
						{
							"type": "model",
							"name": "DroneNuwa",
							"source": "Character/Vernius/Unit/Nuwa/DroneNuwa.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/DroneNuwa/Anim_DroneNuwa_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/DroneNuwa/Anim_DroneNuwa_Skill_Loop.fbx",
									"loop": true
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
					"emissive": 1,
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "material",
							"name": "material",
							"enabled": false,
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "Back",
									"colorMask": 255,
									"emissive": 1.5
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "material",
							"name": "material",
							"props": {
								"PBR": {
									"mode": "BeforeTonemapping",
									"blend": "Alpha",
									"shadows": false,
									"culling": "Front",
									"depthTest": "Greater",
									"colorMask": 15,
									"enableStencil": true,
									"alphaKill": false,
									"stencilFailOp": "Keep",
									"depthFailOp": "Keep",
									"stencilPassOp": "Replace",
									"stencilCompare": "NotEqual",
									"stencilValue": 2,
									"stencilReadMask": 2,
									"stencilWriteMask": 0,
									"emissive": 1
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.25
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
							"enabled": false,
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
									0.3568627450980392,
									0.20392156862745098,
									0.615686274509804
								]
							}
						}
					]
				}
			]
		},
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
		}
	]
}