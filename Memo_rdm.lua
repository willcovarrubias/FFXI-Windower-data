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

include('Memo-Include.lua')
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Normal', 'Tank')
    state.CastingMode:options('Normal', 'MB', 'Forever', 'ForeverMB')
	state.IdleMode:options('Idle', 'Refresh', 'Tank')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')
	
	send_command('alias craftgear input //gs equip sets.crafting')

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience orb", head=gear.merlinicHood_FC, hands=gear.merlinicDastanas_FC,neck="Baetyl Pendant", ear1="Enchanter earring +1",ear2="Etiolation earring", 
	body=gear.merlinicJubbah_FC,back="Swith cape +1",ring1="Prolix ring", ring2="Kishar ring",legs="Psycloth lappas", feet=gear.merlinicCrackows_FC}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {back="Disperser's cape", feet="Vanya clogs"})
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight cloak", head=empty})
	
	
    -- Precast sets to enhance JAs
	--sets.precast.JA[''] = {}
    
    -- Weaponskill sets
        
    sets.precast.WS['Savage Blade'] = {ammo="Floestone",
        head="Jhakri coronal +2",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Rufescent ring",ring2="Ifrit ring +1",
        back="",waist="Metalsinger Belt",legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
		
		
		
    -- Midcast Sets // ('Normal', 'MB', 'NormalMerit', 'MBMerit')
	
	sets.midcast['Elemental Magic'] = {main={name="Grioavolr", priority=16},sub={name="Enki strap", priority=15},ammo="Pemphredo tathlum",
        head="Jhakri coronal +2",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Regal earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="",waist=gear.ElementalObi,legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
	
	sets.midcast['Elemental Magic'].MB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, neck="Mizukage-no-Kubikazari",body=gear.merlinicJubbah_MBB,hands="Amalric gages +1", 
	legs=gear.merlinicShalwar_MBB, ring1="Mujin band", feet=gear.merlinicCrackows_MBB})

	sets.midcast['Elemental Magic'].Forever = set_combine(sets.midcast['Elemental Magic'], {body="Seidr cotehardie"})
	
	sets.midcast['Elemental Magic'].ForeverMB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, neck="Mizukage-no-Kubikazari",body="Seidr cotehardie", 
	hands="Amalric gages +1", ring1="Mujin band", legs=gear.merlinicShalwar_MBB,feet=gear.merlinicCrackows_MBB})  	
		
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	sets.midcast.Impact.MB = set_combine(sets.midcast['Elemental Magic'].MB, {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	
	--sets.midcast.FastRecast = {
	--	head="Blistering sallet +1",neck="Incanter's torque", body="Jhakri robe +2", hands="Jhakri cuffs +2", ring2="Shiva Ring +1",
	--	waist="Goading belt",legs="Assiduity pants +1",feet=gear.merlinicCrackows_FC}
	
	sets.midcast['Enhancing Magic'] = {sub="Ammurapi shield",ear2="Andoaa earring", head=gear.telchineCap_ENH, body=gear.telchineChasuble_ENH, hands=gear.telchineGloves_ENH, 
	legs=gear.telchineBraconi_ENH, feet=gear.telchinePigaches_ENH, back="Merciful cape", waist="Siegel sash"}
	
	sets.midcast['Enfeebling Magic'] = {main={name="Grioavolr", priority=16},sub={name="Enki strap", priority=15},ammo="Pemphredo tathlum",
        head="Jhakri coronal +2",neck="Incanter's torque",ear1="Enchanter earring +1",ear2="Dignitary's earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Etana ring",ring2="Kishar ring",
        back="",waist="Luminary sash",legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
   
	sets.midcast['Healing Magic'] = set_combine(sets.midcast.FastRecast, {main="Serenity", sub="Enki strap",
		head=gear.telchineCap_ENH,neck="Incanter's torque",
		body="Chironic doublet",hands=gear.telchineGloves_ENH, 
		back="Solemnity cape",wait="Luminary sash",legs=gear.telchineBraconi_ENH,feet="Medium's sabots"})

	sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast, {main="Grioavolr",head="Appetence crown", neck="Erra pendant",ring1="Excelsis ring", ear2="Hirudinea earring", ring2="Evanescence ring", legs="Jhakri slops +2", feet=gear.merlinicCrackows_MBB})
	    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {main={name="Terra's Staff", priority=16},sub={name="Oneiros Grip", priority=15}, ammo="Homiliary",
        head="Befouled crown",neck="Loricate torque +1",ear1="Genmei earring",ear2="Etiolation earring",
        body="Shamash robe",hands="Volte gloves",ring1="Vocane ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="Carmine cuisses +1",feet=gear.merlinicCrackows_FC}		
	
	sets.idle.Refresh = {main={name="Terra's Staff", priority=16},sub={name="Oneiros Grip", priority=15},ammo="Homiliary",
        head="Befouled crown",neck="Loricate torque +1",ear1="Genmei earring",ear2="Etiolation earring",
        body="Jhakri robe +2",hands="Volte gloves",ring1="Vocane ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet=gear.merlinicCrackows_FC}    

	sets.idle.Tank = {main={name="Terra's Staff", priority=16},sub={name="Alber strap", priority=15},ammo="Staunch tathlum",
        head="Befouled crown",neck="Loricate torque +1",ear1="Genmei earring",ear2="Etiolation earring",
        body="Shamash robe",hands="Volte gloves",ring1="Vocane ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="",feet=gear.merlinicCrackows_FC}    
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Twilight Torque",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Twilight Torque",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Carmine cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {ammo="Ginsen",
        head="Blistering sallet +1",neck="Combatant's torque",ear1="Sherida earring",ear2="Brutal earring",
        body="Ayanmo corazza +2",hands="Leyline gloves",ring1="Petrov ring",ring2="Cacoethic ring +1",
        back="Lupine cape",waist="Windbuffet belt +1",legs="Ayanmo Cosciales +2",feet="Battlecast gaiters"}

	sets.engaged.Tank = {}




    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Yamabuki-no-obi"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Rairin obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == "Blue Magic" then
		gear.default.obi_waist = "Salire Belt"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hyorin obi"
		end
	end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
--function job_precast(spell, action, spellMap, eventArgs)
--    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
--        eventArgs.handled = true
--   end
    
--    if spell.skill == 'Healing Magic' then
--       gear.default.obi_back = "Mending Cape"
--    else
--        gear.default.obi_back = "Toro Cape"
--    end
--end


--function job_post_midcast(spell, action, spellMap, eventArgs)
--    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
--    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
--        equip(sets.buff['Divine Caress'])
--    end
--end

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
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 10)
end
