--
function get_sets()
	mote_include_version = 2
	include('Mote-Include.lua')
end

--
function job_setup()
	state.Buff.Aftermath = buffactive.Aftermath or false
	get_combat_weapon()
	
	include('Memo-Include.lua')
	
	send_command('alias ei input /equip main "Trainee burin"; input /equip neck "Combatant\'s torque";' )
	send_command('alias koki input /equip main "Wooden katana"; input /equip neck "Combatant\'s torque"; input /equip head "Kengo hachimaki"; input /equip sub "Utu grip";' )
	send_command('alias rag input /equip main "Ragnarok"; input /equip sub "Utu grip";' )
	send_command('alias kc input /equip main "Kraken club";' )
	send_command('alias sod input /equip main "Bahamut Zaghnal";' )
	send_command('alias staff input /equip main "Terra\'s staff";' )
	send_command('alias brav input /equip main "Bravura"; input /equip sub "Utu grip";' )
	send_command('alias chango input /equip main "Chango"; input /equip sub "Utu grip";' )
	send_command('alias monte input /equip main "Montante +1"; input /equip sub "Utu grip";' )
	send_command('alias shield input /equip main "Tanmogayi +1"; input /equip sub "Blurred Shield";' )
	send_command('alias axe input /equip main "Farsha"; input /equip sub "Blurred Shield";' )	
	send_command('alias craftgear input //gs equip sets.crafting')
	
	state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes'] or false
	
end

--
function user_setup()
	state.OffenseMode:options('Normal', 'ACC', 'Hybrid', 'Tank')
	state.IdleMode:options('Idle', 'Tank')
	set_macro_page(1, 1)
end

--
function job_status_change(cmdParams, eventArgs)
	get_combat_weapon()
end

--
function get_combat_weapon()
    if player.equipment.main == 'Bravura' then
        state.CombatWeapon:set('Bravura')
    else
        state.CombatWeapon:reset()
    end
end

--
function job_buff_change(buff, gain)

	if S{'aftermath'}:contains(buff:lower()) and player.equipment.main == 'Bravura' then

		classes.CustomMeleeGroups:clear()

		if buffactive.Aftermath then
			classes.CustomMeleeGroups:append('aftermath')
        	end

		if not midaction() then
			handle_equipping_gear(player.status)
		end

	end

end

--
function job_precast(spell, action, spellMap, eventArgs)

	if spell.action_type == 'Magic' and windower.ffxi.get_spell_recasts()[spell.recast_id] > 0 then
		cancel_spell()
		return
	end

	eventArgs.useMidcastGear=true

end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and state.Buff['Mighty Strikes'] then
        equip(sets.buff['Mighty Strikes'])
    end
end


--
function init_gear_sets()

	--IDLE SETS--
	sets.idle = {ammo="Staunch tathlum",
        head="Valorous mask",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Souveran cuirass +1",hands="Sulevia's gauntlets +2",ring1="Vocane Ring",ring2="Defending ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Sulevia's cuisses +2",feet="Hermes' sandals"}

    sets.idle.Tank = {ammo="Staunch tathlum",
        head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Souveran cuirass +1",hands="Sulevia's gauntlets +2",ring1="Vocane Ring",ring2="Defending Ring",
		back="Moonbeam cape",waist="Flume belt +1",legs="Sulevia's cuisses +2",feet="Souveran Schuhs +1"}


	--OFFENSE MODE SETS--
	sets.engaged = {ammo="Ginsen",
        head="Flamma zucchetto +2",neck="Asperity necklace",ear1="Telos earring",ear2="Brutal Earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Petrov ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_DA,waist="Ioskeha belt +1",legs=gear.odysseanLegs_STP,feet="Pummeler's Calligae +3"}
	
	sets.engaged.ACC = {ammo="Seething bomblet +1",
        head="Pummeler's mask +3",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Pummeler's Lorica +3",hands="Flamma manopolas +2",ring1="Regal ring",ring2="Cacoethic ring +1",
        back=gear.cicholMantle_DA,waist="Ioskeha belt +1",legs="Pummeler's cuisses +3",feet="Pummeler's Calligae +3"}
	
	sets.engaged.Hybrid = {ammo="Seething bomblet +1", --TODO: Add Arke body and Ioskeha belt +1!
        head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Telos earring",ear2="Dignitary's earring",
        body="Souveran cuirass +1",hands="Sulevia's gauntlets +2",ring1="Vocane ring",ring2="Defending ring",
        back=gear.cicholMantle_DA,waist="Ioskeha belt +1",legs="Pummeler's cuisses +3",feet="Pummeler's Calligae +3"}
		
	sets.engaged.Tank = {ammo="Staunch tathlum",
        head="Souveran schaller +1",neck="Loricate torque +1",ear1="Thureous earring",ear2="Odnowa earring +1",
        body="Souveran cuirass +1",hands="Souveran handschuhs +1",ring1="Vocane Ring",ring2="Defending ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Souveran diechlings +1",feet="Souveran Schuhs +1"}

	sets.engaged.Bravura = sets.engaged

	sets.engaged.Bravura.ACC = sets.engaged.ACC

	sets.engaged.Bravura.Hybrid = sets.engaged.Hybrid
	
	sets.engaged.Bravura.Tank = sets.engaged.Tank

	--AFTERMATH SETS--
	sets.engaged.Bravura.Hybrid.aftermath = {ammo="Seething bomblet +1", --TODO: Add Arke body and Ioskeha belt +1!
        head="Sulevia's mask +2",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Vocane ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Ioskeha belt +1",legs="Pummeler's cuisses +3",feet="Pummeler's Calligae +3"}


	--WEAPONSKILL SETS--
	sets.precast.WS['Black Halo'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Rufescent ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Metalsinger belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Cloudsplitter'] = {ammo="Pemphredo tathlum",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva Ring +1",ring2="Rufescent Ring",
        back=gear.cicholMantle_MAB,waist="Eschan stone",legs=gear.odysseanLegs_MAB,feet="Founder's greaves"}
	
	sets.precast.WS['Fell Cleave'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Sulevia's platemail +2",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
	
	sets.precast.WS['Full Break'] = {ammo="Knobkierrie",
        head="Flamma zucchetto +2",neck="Fotia gorget",ear1="Ishvara earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flamma manopolas +2",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Flamma Dirs +2",feet="Flamma Gambieras +2"}
		
	sets.precast.WS['Ground Strike'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Odnowa earring +1",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}	
	
	sets.precast.WS['King\'s Justice'] = {ammo="Seething bomblet +1",
        head="Agoge mask +3",neck="Fotia gorget",ear1="Moonshade earring",ear2="Brutal earring",
        body="Sulevia's platemail +2",hands="Argosy mufflers +1",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}

    sets.precast.WS['Metatron Torment'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Mistral Axe'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Metalsinger belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}

	sets.precast.WS['Rampage'] = {ammo="Seething bomblet +1",
        head="Boii mask +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Tatenashi haramaki +1",hands="Flamma manopolas +2",ring1="Begrudging ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
    
	sets.precast.WS['Requiescat'] = {ammo="Seething bomblet +1",
        head="Argosy celata +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Argosy hauberk +1",hands="Argosy mufflers +1",ring1="Regal Ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
	
	sets.precast.WS['Resolution'] = {ammo="Seething bomblet +1",
        head="Flamma zucchetto +2",neck="Fotia gorget",ear1="Telos earring",ear2="Moonshade earring",
        body="Argosy hauberk +1",hands="Argosy mufflers +1",ring1="Regal Ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}

	sets.precast.WS['Ruinator'] = {ammo="Seething bomblet +1",
        head="Argosy celata +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Argosy hauberk +1",hands="Argosy mufflers +1",ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Knobkierrie",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva Ring +1",ring2="Rufescent ring",
        back=gear.cicholMantle_WSD,waist="Fotia belt",legs=gear.valorousHose_WSD,feet="Founder's greaves"}

	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Metalsinger belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
	
	sets.precast.WS['Scourge'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Odnowa earring +1",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Ukko\'s Fury'] = {ammo="Knobkierrie",
        head="Boii mask +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Argosy hauberk +1",hands="Flamma manopolas +2",ring1="Begrudging ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
		
	sets.precast.WS['Upheaval'] = {ammo="Knobkierrie",
        head="Agoge mask +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Moonshade earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Regal Ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}	
		
	sets.precast.WS['Vorpal Blade'] = {ammo="Seething bomblet +1",
        head="Boii mask +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Tatenashi haramaki +1",hands="Flamma manopolas +2",ring1="Begrudging ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}

		
	--JA SETS--
	sets.precast.JA['Provoke'] = {head="Loess barbuta +1",neck="Unmoving collar +1",ear1="Cryptic earring",ear2="Pluto's pearl",
			body="Souveran cuirass +1",hands="Souveran handschuhs +1",ring1="Petrov ring",ring2="Eihwaz ring",
			back="Reiki Cloak",waist="Goading belt",legs="Souveran diechlings +1",feet="Souveran Schuhs +1"}

	sets.precast.JA['Mighty Strikes'] = {hands="Warrior's mufflers +2"}

	sets.precast.JA['Berserk'] = {body="Pummeler's Lorica +3",feet="Agoge Calligae +3",back=gear.cicholMantle_DA}

	sets.precast.JA['Warcry'] = {head="Agoge mask +3"}

	sets.precast.JA['Aggressor'] = {head="Pummeler's mask +3",body="Agoge Lorica +3"}

	sets.precast.JA['Warrior\'s Charge'] = {legs="Warrior's Cuisses +2"}

	sets.precast.JA['Tomahawk'] = {ammo="Throwing Tomahawk", feet="Agoge Calligae +3"}

	sets.precast.JA['Blood Rage'] = {body="Ravager's Lorica +2"}
    
	sets.precast.JA['Jump'] = {ammo="Ginsen",
        head="Sulevia's mask +2",neck="Asperity necklace",ear1="Telos earring",ear2="Brutal Earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Petrov ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Ioskeha belt +1",legs=gear.odysseanLegs_STP,feet="Ostro greaves"}
		
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
        head="Sulevia's mask +2",neck="Asperity necklace",ear1="Telos earring",ear2="Brutal Earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Petrov ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Ioskeha belt +1",legs=gear.odysseanLegs_STP,feet="Ostro greaves"}
	

	--CASTING SETS--
	sets.precast.FC = {ammo="Sapience orb",neck="Baetyl Pendant",
		body=gear.odysseanChest_FC,hands="Leyline gloves",ring1="Rahab ring",ring2="Prolix ring",ear1="Etiolation Earring",ear2="Enchanter earring +1", 
		legs="Eschite cuisses", feet=gear.odysseanGreaves_FC}
		
	sets.buff['Mighty Strikes'] = {ammo="Seething bomblet +1",
        head=gear.valorousMask_CRTD,neck="Fotia gorget",ear1="Telos earring",ear2="Moonshade earring",
        body=gear.valorousMail_CRTD,hands=gear.valorousMitts_CRTD,ring1="Regal Ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs=gear.valorousHose_CRTD,feet=gear.valorousGreaves_CRTD}


end