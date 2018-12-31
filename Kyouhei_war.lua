-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

	include('Kyouhei-Include.lua')
	
	send_command('alias ei input /equip main "Trainee burin"; input /equip neck "Combatant\'s torque";' )
	send_command('alias koki input /equip main "Wooden katana"; input /equip neck "Combatant\'s torque"; input /equip head "Kengo hachimaki"; input /equip sub "Utu grip";' )
	send_command('alias rag input /equip main "Zulfiqar"; input /equip sub "Utu grip";' )
	send_command('alias shield input /equip main "Tanmogayi +1"; input /equip sub "Blurred Shield";' )
	send_command('alias axe input /equip main "Digirbalag"; input /equip sub "Blurred Shield";' )
	
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('STP', 'ACC', 'Tank', 'Hybrid')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'Tank')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    --sets.precast.FC = {main=gear.FastcastStaff,ammo="Sapience orb",
      --  head="Nahtirah Hat",neck="Orison Locket",ear2="Enchanter earring +1",
        --body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
        --back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}

	sets.precast.FC = {ammo="Sapience orb",neck="Voltsurge torque",body=gear.odysseanChest_FC, ring1="Prolix ring", ring2="Veneficium ring",ear1="Etiolation Earring",ear2="Enchanter earring +1", 
	hands="Leyline gloves",legs="Eschite cuisses", feet=gear.odysseanGreaves_FC}
        
    --sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    --sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

   -- sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Orison Pantaloons +2"})

  --  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  --  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens"})
  --  sets.precast.FC.Curaga = sets.precast.FC.Cure
 --   sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
  --  sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
  --  sets.precast.Waltz = {
    --    head="Nahtirah Hat",ear1="Roundel Earring",
    --    body="Vanir Cotehardie",hands="Yaoyotl Gloves",
   --     back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
   -- gear.default.weaponskill_neck = "Asperity Necklace"
    --gear.default.weaponskill_waist = ""
    sets.precast.JA['Provoke'] = 
		{
			head="Loess barbuta +1",neck="Unmoving collar +1",	ear1="Cryptic earring",ear2="Pluto's pearl",
			body="Souveran cuirass",hands="Souveran handschuhs",ring1="Petrov ring",ring2="Eihwaz ring",
			back="Mubvumbamiri mantle",waist="Goading belt",legs="Souveran diechlings",feet="Souveran schuhs"
		}

	sets.precast.JA['Mighty Strikes'] = 
		{
			hands="Warrior's mufflers +2"
		}

	sets.precast.JA['Berserk'] = 
		{
			body="Pummeler's Lorica +3",feet="Agoge Calligae +1",back=gear.cicholMantle_DA
		}

	sets.precast.JA['Warcry'] = 
		{
			head="Agoge mask +1"
		}

	sets.precast.JA['Aggressor'] = 
		{
			head="Pummeler's Mask +2",body="Agoge Lorica +1"
		}

	sets.precast.JA['Warrior\'s Charge'] = 
		{
			legs="Warrior's Cuisses +2"
		}

	sets.precast.JA['Tomahawk'] = 
		{
			ammo="Throwing Tomahawk", feet="Agoge Calligae +1"
		}

	sets.precast.JA['Blood Rage'] = 
		{
			body="Ravager's Lorica +2"
		}
    
	sets.precast.JA['Jump'] = {ammo="Ginsen",
        head="Sulevia's mask +2",neck="Asperity necklace",ear1="Telos earring",ear2="Brutal Earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +1",ring1="Petrov ring",ring2="Rajas ring",
        back=gear.cicholMantle_DA,waist="Goading belt",legs=gear.odysseanLegs_STP,feet="Ostro greaves"}
		
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
        head="Sulevia's mask +2",neck="Asperity necklace",ear1="Telos earring",ear2="Brutal Earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +1",ring1="Petrov ring",ring2="Rajas ring",
        back=gear.cicholMantle_DA,waist="Goading belt",legs=gear.odysseanLegs_STP,feet="Ostro greaves"}

		
	-------Weapon Skill Sets------
	
	sets.precast.WS['Black Halo'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Rufescent ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Metalsinger belt",legs="Boii cuisses +1",feet="Sulevia's leggings +1"}
		
	sets.precast.WS['Cloudsplitter'] = {ammo="Knobkierrie",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Rufescent Ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia belt",legs="Boii cuisses +1",feet="Founder's greaves"}
	
	sets.precast.WS['Fell Cleave'] = {ammo="Knobkierrie",
        head="Sulevia's mask +2	",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Sulevia's platemail +1",hands=gear.odysseanGauntlets_WSD,ring1="Ifrit ring +1",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
		
	sets.precast.WS['Ground Strike'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Fotia gorget",ear1="Ishvara earring",ear2="Odnowa earring +1",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Ifrit ring +1",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +1"}	
	
	sets.precast.WS['King\'s Justice'] = {ammo="Knobkierrie",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Sulevia's platemail +1",hands="Argosy mufflers +1",ring1="Ifrit ring +1",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}

    sets.precast.WS['Metatron Torment'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Ifrit ring +1",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +1"}
		
	sets.precast.WS['Mistral Axe'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Ifrit ring +1",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Metalsinger belt",legs="Boii cuisses +1",feet="Sulevia's leggings +1"}

	sets.precast.WS['Rampage'] = {ammo="Seething bomblet +1",
        head="Boii mask +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Tatenashi haramaki +1",hands="Flamma manopolas +1",ring1="Begrudging ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
    
	sets.precast.WS['Requiescat'] = {ammo="Seething bomblet +1",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Sulevia's platemail +1",hands="Argosy mufflers +1",ring1="Rufescent Ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Boii cuisses +1",feet="Pummeler's Calligae +3"}
	
	sets.precast.WS['Resolution'] = {ammo="Seething bomblet +1",
        head="Sulevia's mask +1",neck="Fotia gorget",ear1="Odnowa earring +1",ear2="Brutal earring",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +1",ring1="Petrov Ring",ring2="K'ayres ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Sulevia's cuisses +1",feet="Sulevia's leggings +1"}

	sets.precast.WS['Ruinator'] = {ammo="Seething bomblet +1",
        head="Sulevia's mask +2",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Sulevia's platemail +1",hands="Argosy mufflers +1",ring1="Ifrit ring +1",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Knobkierrie",
        head="Jumalik helm",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body="Founder's breastplate",hands=gear.valorousMitts_MAB,ring1="Shiva ring",ring2="Rufescent ring",
        back=gear.cicholMantle_WSD,waist="Fotia belt",legs="Boii cuisses +1",feet="Founder's greaves"}

	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Rufescent ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Metalsinger belt",legs="Boii cuisses +1",feet="Sulevia's leggings +1"}
	
	sets.precast.WS['Scourge'] = {ammo="Knobkierrie",
        head=gear.odysseanHelm_WSD,neck="Fotia gorget",ear1="Ishvara earring",ear2="Odnowa earring +1",
        body="Pummeler's Lorica +3",hands=gear.odysseanGauntlets_WSD,ring1="Ifrit ring +1",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +1"}
		
	sets.precast.WS['Ukko\'s Fury'] = {ammo="Knobkierrie",
        head="Boii mask +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Tatenashi haramaki +1",hands="Flamma manopolas +1",ring1="Begrudging ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_WSD,waist="Fotia Belt",legs="Argosy breeches +1",feet="Pummeler's Calligae +3"}
		
	sets.precast.WS['Vorpal Blade'] = {ammo="Seething bomblet +1",
        head="Boii mask +1",neck="Fotia gorget",ear1="Ishvara earring",ear2="Brutal Earring",
        body="Tatenashi haramaki +1",hands="Flamma manopolas +1",ring1="Begrudging ring",ring2="Niqmaddu Ring",
        back=gear.cicholMantle_DA,waist="Fotia Belt",legs="Boii cuisses +1",feet="Pummeler's Calligae +3"}
    

    -- Midcast Sets
    
    --sets.midcast.FastRecast = {
     --   head="Nahtirah Hat",ear2="Enchanter earring +1",
      --  body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
      --  back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
    -- Cure sets
  --  gear.default.obi_waist = "Goading Belt"
  --  gear.default.obi_back = "Mending Cape"

   
   -- sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Sapience orb",
    --    head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
    --    body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
    --    back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

   

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    --sets.resting = {main=gear.Staff.HMP, 
      --  body="Gendewitha Bliaut",hands="Serpentes Cuffs",
        --waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {ammo="Staunch tathlum",
        head=gear.valorousMask_STP,neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Souveran cuirass",hands="Sulevia's gauntlets +2",ring1="Vocane Ring",ring2="Defending ring",
        back="Philidor mantle",waist="Nierenschutz",legs="Sulevia's cuisses +1",feet="Hermes' sandals"}

    sets.idle.Tank = {ammo="Staunch tathlum",
        head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Souveran cuirass",hands="Sulevia's gauntlets +2",ring1="Vocane Ring",ring2="Defending Ring",
		back="Philidor mantle",waist="Flume belt",legs="Sulevia's cuisses +1",feet="Amm greaves"}
	    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Loricate torque",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Loricate torque",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Hermes' sandals"}

   -- sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
	
	sets.engaged.STP = {ammo="Ginsen",
        head=gear.valorousMask_STP,neck="Lissome necklace",ear1="Dignitary's earring",ear2="Brutal Earring",
        body=gear.odysseanChest_DA,hands="Flamma manopolas +1",ring1="Petrov ring",ring2="K'ayres Ring",
        back=gear.cicholMantle_DA,waist="Goading belt",legs=gear.odysseanLegs_STP,feet="Flamma gambieras +1"}
	
	sets.engaged.ACC = {ammo="Seething bomblet +1",
        head=gear.valorousMask_STP,neck="Combatant's torque",ear1="Telos earring",ear2="Zennaroi earring",
        body="Pummeler's Lorica +3",hands="Flamma manopolas +1",ring1="Cacoethic ring",ring2="Cacoethic ring +1",
        back=gear.cicholMantle_DA,waist="Ioskeha belt",legs=gear.odysseanLegs_WSD,feet="Pummeler's Calligae +3"}
	
	sets.engaged.Tank = {ammo="Ginsen",
        head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Telos earring",ear2="Genmei earring",
        body="Souveran cuirass",hands="Sulevia's gauntlets +2",ring1="Defending Ring",ring2="Vocane ring",
        back=gear.cicholMantle_DA,waist="Tempus fugit",legs="Sulevia's cuisses +1",feet="Souveran schuhs"}
		
	sets.engaged.Hybrid = {ammo="Seething bomblet +1",
        head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Telos earring",ear2="Zennaroi earring",
        body="Sulevia's platemail +1",hands="Sulevia's gauntlets +2",ring1="Vocane ring",ring2="Defending ring",
        back=gear.cicholMantle_DA,waist="Sailfi belt +1",legs="Pummeler's cuisses +3",feet="Pummeler's Calligae +3"}
	


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 1)
end
