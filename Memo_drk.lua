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
	set_macro_page(1, 16)
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
        head="Jumalik helm",neck="Loricate torque +1",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Chozoron coselete",hands=gear.valorousMitts_Refresh,ring1="Vocane Ring",ring2="Defending ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Carmine cuisses +1",feet="Sulevia's leggings +2"}

    sets.idle.Tank = {ammo="Staunch tathlum",
        head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Vocane Ring",ring2="Defending Ring",
		back="Moonbeam cape",waist="Flume belt +1",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}


	--OFFENSE MODE SETS--
	sets.engaged = {ammo="Ginsen",
        head="Flamma zucchetto +2",neck="Asperity necklace",ear1="Cessance earring",ear2="Brutal Earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Petrov ring",ring2="Niqmaddu Ring",
        back="",waist="Ioskeha belt +1",legs=gear.odysseanLegs_STP,feet="Flamma gambieras +2"}
	
	sets.engaged.ACC = {ammo="Seething bomblet +1",
        head="",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="",hands="Flamma manopolas +2",ring1="Regal ring",ring2="Cacoethic ring +1",
        back="",waist="Ioskeha belt +1",legs="",feet=""}
	
	sets.engaged.Hybrid = {ammo="Seething bomblet +1", --TODO: Add Arke body and Ioskeha belt +1!
        head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Telos earring",ear2="Dignitary's earring",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Vocane ring",ring2="Defending ring",
        back="",waist="Ioskeha belt +1",legs="",feet=""}
		
	sets.engaged.Tank = {ammo="Staunch tathlum",
        head="",neck="Loricate torque +1",ear1="Thureous earring",ear2="Odnowa earring +1",
        body="",hands="",ring1="Vocane Ring",ring2="Defending ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="",feet=""}

	sets.engaged.Bravura = sets.engaged

	sets.engaged.Bravura.ACC = sets.engaged.ACC

	sets.engaged.Bravura.Hybrid = sets.engaged.Hybrid
	
	sets.engaged.Bravura.Tank = sets.engaged.Tank

	--AFTERMATH SETS--
	sets.engaged.Bravura.Hybrid.aftermath = {ammo="Seething bomblet +1", --TODO: Add Arke body and Ioskeha belt +1!
        head="Sulevia's mask +2",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Vocane ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Ioskeha belt +1",legs="Pummeler's cuisses +3",feet="Argosy sollerets +1"}


	--WEAPONSKILL SETS--
		
	sets.precast.WS['Cross Reaper'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body=gear.valorousMail_WSD,hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back="",waist="Metalsinger belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}	
	
	sets.precast.WS['Ground Strike'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Fotia gorget",ear1="Ishvara earring",ear2="Odnowa earring +1",
        body=gear.valorousMail_WSD,hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back="",waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}	
		
	sets.precast.WS['Insurgency'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body=gear.valorousMail_WSD,hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back="",waist="Fotia belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Quietus'] = {ammo="Seething bomblet +1",
        head="Argosy celata +1",neck="Fotia gorget",ear1="Telos earring",ear2="Moonshade earring",
        body="Argosy hauberk +1",hands="Argosy mufflers +1",ring1="Regal Ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Argosy breeches +1",feet="Argosy sollerets +1"}
    
	sets.precast.WS['Requiescat'] = {ammo="Seething bomblet +1",
        head="Argosy celata +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Argosy hauberk +1",hands="Argosy mufflers +1",ring1="Regal Ring",ring2="Niqmaddu Ring",
        back="",waist="Fotia Belt",legs="Argosy breeches +1",feet="Argosy sollerets +1"}
	
	sets.precast.WS['Resolution'] = {ammo="Seething bomblet +1",
        head="Argosy celata +1",neck="Fotia gorget",ear1="Telos earring",ear2="Moonshade earring",
        body="Argosy hauberk +1",hands="Argosy mufflers +1",ring1="Regal Ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Argosy breeches +1",feet="Argosy sollerets +1"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Knobkierrie",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva Ring +1",ring2="Rufescent ring",
        back="",waist="Fotia belt",legs=gear.valorousHose_WSD,feet="Founder's greaves"}

	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body=gear.valorousMail_WSD,hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back="",waist="Metalsinger belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
	
	sets.precast.WS['Scourge'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Fotia gorget",ear1="Ishvara earring",ear2="Odnowa earring +1",
        body=gear.valorousMail_WSD,hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back="",waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Torcleaver'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Caro necklace",ear1="Ishvara earring",ear2="Moonshade earring",
        body=gear.valorousMail_WSD,hands=gear.odysseanGauntlets_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
        back="",waist="Metalsinger Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}
		
	sets.precast.WS['Vorpal Blade'] = {ammo="Seething bomblet +1",
        head="Boii mask +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Tatenashi haramaki +1",hands="Flamma manopolas +2",ring1="Begrudging ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Argosy breeches +1",feet="Argosy sollerets +1"}

		
	--JA SETS--
	sets.precast.JA['Provoke'] = {head="Loess barbuta +1",neck="Unmoving collar +1",ear1="Cryptic earring",ear2="Pluto's pearl",
			body="Souveran cuirass +1",hands="Souveran handschuhs +1",ring1="Petrov ring",ring2="Eihwaz ring",
			back="Reiki Cloak",waist="Goading belt",legs="Souveran diechlings +1",feet="Souveran Schuhs +1"}

	sets.precast.JA['Mighty Strikes'] = {hands="Warrior's mufflers +2"}

	sets.precast.JA['Berserk'] = {body=gear.valorousMail_WSD,feet="Agoge Calligae +3",back=gear.cicholMantle_DA}

	sets.precast.JA['Warcry'] = {head="Agoge mask +1"}

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
	sets.precast.FC = {ammo="Sapience orb",
		head="Carmine mask",neck="Baetyl Pendant",
		body=gear.odysseanChest_FC,hands="Leyline gloves",ring1="Rahab ring",ring2="Prolix ring",ear1="Etiolation Earring",ear2="Enchanter earring +1", 
		legs="Eschite cuisses", feet=gear.odysseanGreaves_FC}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight cloak", head=empty})
		
	sets.buff['Mighty Strikes'] = {ammo="Seething bomblet +1",
        head=gear.valorousMask_CRTD,neck="Fotia gorget",ear1="Telos earring",ear2="Moonshade earring",
        body=gear.valorousMail_CRTD,hands=gear.valorousMitts_CRTD,ring1="Regal Ring",ring2="Niqmaddu ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs=gear.valorousHose_CRTD,feet=gear.valorousGreaves_CRTD}
		
	--Casting Midcast--	
	sets.midcast.FastRecast = {
		neck="Incanter's torque",ring2="Kishar ring",waist="Ioskeha belt +1"}
	
	sets.midcast['Elemental Magic'] = {ammo="Pemphredo tathlum",
        head="",neck="Incanter's torque",ear1="",ear2="g",
        body="",hands="",ring1="",ring2="Shiva Ring +1",
        back="",waist="",legs="",feet=""}

	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo tathlum",
        head="",neck="Erra pendant",ear1="",ear2="g",
        body="",hands="",ring1="",ring2="Shiva Ring +1",
        back="",waist="",legs="",feet=""}

	sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast, {ammo="Pemphredo tathlum",
		head="Flamma zucchetto +2", neck="Erra pendant",ring1="Excelsis ring", ear1="Dignitary's earring",ear2="Hirudinea earring",
		body="Flamma korazin +2", hands="Flamma manopolas +2",ring1="Archon ring",ring2="Evanescence ring",
		waist="Eschan stone",legs="Flamma dirs +2", feet="Flamma gambieras +2"})

	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {body="Twilight cloak", head=empty,ring2="Archon Ring"})

	sets.midcast['Dread Spikes'] = {ammo="",
        head=gear.odysseanHelm_WSD,neck="Sanctity necklace",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Flamma korazin +2",hands="Flamma manopolas +2",ring1="Eihwaz ring",ring2="Meridian ring",
        back="",waist="Eschan stone",legs="Flamma dirs +2",feet="Flamma gambieras +2"}


end