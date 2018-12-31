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

include('Memosan-Include.lua')
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Acc', 'PDT')
    state.CastingMode:options('Normal', 'MB', 'Forever', 'ForeverMB')
	state.IdleMode:options('Idle', 'Refresh')
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
    sets.precast.FC = {main="Sucellus",ammo="Sapience Orb", head=gear.merlinicHood_FC, hands=gear.merlinicDastanas_FC,neck="Voltsurge torque", ear1="",ear2="Loquacious earring", 
	body="Shango robe",back="Lugh's Cape",ring1="Kishar Ring", ring2="",legs="Psycloth lappas", feet=gear.merlinicCrackows_FC}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	--sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {back=""})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight cloak", head=empty})
	
	
    -- Precast sets to enhance JAs
    
    -- Weaponskill sets
		
    sets.precast.WS['Myrkr'] = {}	
		
		
    -- Midcast Sets // ('Normal', 'MB', 'Forever', 'ForeverMB')
	
	sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid strap",ammo="Hydrocera",
        head="Jhakri coronal +1",neck="Baetyl pendant",ear1="Friomisi earring",ear2="Novio earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +1",ring1="Jhakri Ring",ring2="Jhakri ring",
        back="Bookworm's cape",waist=gear.ElementalObi,legs="Jhakri slops +1",feet="Jhakri pigaches +1"}
	
	sets.midcast['Elemental Magic'].MB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, neck="Baetyl pendant",body=gear.merlinicJubbah_MBB,hands="Amalric gages", 
	legs=gear.merlinicShalwar_MBB, ring1="Mujin band", feet=gear.merlinicCrackows_MBB})

	sets.midcast['Elemental Magic'].Forever = set_combine(sets.midcast['Elemental Magic'], {body="Seidr cotehardie"})
	
	sets.midcast['Elemental Magic'].ForeverMB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, neck="Baetyl pendant",body="Seidr cotehardie", 
	hands="Amalric gages", ring1="Mujin band", legs=gear.merlinicShalwar_MBB,feet=gear.merlinicCrackows_MBB})
   	
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	sets.midcast.Impact.MB = set_combine(sets.midcast['Elemental Magic'].MB, {body="Twilight cloak", head=empty,ring2="Archon Ring"})
	
	sets.midcast.FastRecast = {
		head="Blistering sallet +1",neck="Sanctity necklace", body="Jhakri robe +2", hands="Jhakri cuffs +1", ring2="Strendu ring",
		waist="Refoccilation stone",legs="Assiduity pants +1",feet=gear.merlinicCrackows_FC}
		
	--sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {ear2="Andoaa earring", head=gear.telchineCap_ENH, body=gear.telchineChasuble_ENH, hands=gear.telchineGloves_ENH, 
	--legs=gear.telchineBraconi_ENH, feet=gear.telchinePigaches_ENH, back="Merciful cape", waist="Siegel sash"})
	
	sets.midcast['Enhancing Magic'] = {sub="Ammurapi shield",ear2="Andoaa earring", head=gear.telchineCap_ENH, body=gear.telchineChasuble_ENH, hands=gear.telchineGloves_ENH, 
	legs=gear.telchineBraconi_ENH, feet=gear.telchinePigaches_ENH, back="Merciful cape", waist="Siegel sash"}
	
	sets.midcast.Regen = set_combine( sets.midcast['Enhancing Magic'], {main="Bolelabunga",back="Lugh's cape"})
	
	sets.midcast.Haste = sets.midcast['Enhancing Magic']
	
	sets.midcast['Enfeebling Magic'] = {main="Grioavolr", sub="Niobid  strap",ammo="Hydrocera",
        head="Jhakri coronal +1",neck="Sanctity necklace",ear1="Hermetic earring",ear2="Psystorm earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +1",ring1="Globidonta ring",ring2="Jhakri ring",
        back="Aurist's cape +1",waist="Refoccilation stone",legs="Jhakri slops +1",feet="Jhakri pigaches +1"}
   
	sets.midcast['Healing Magic'] = set_combine(sets.midcast.FastRecast, {main="Nibiru cudgel",sub="Legion scutum",body="Chironic doublet", hands=gear.telchineGloves_ENH,
		back="Solemnity cape", legs="Chironic hose", feet="Vanya clogs"})

	sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast, {main="Grioavolr",sub="Niobid strap",head="Jhakri coronal +1",
		back="Bookworm's cape",ring1="Excelsis ring", ear2="Hirudinea earring", ring2="Evanescence ring", legs="Jhakri slops +1", feet="Jhakri pigaches +1"})
    
    -- Idle sets
    sets.idle = {main="Bolelabunga",sub="Ammurapi shield",ammo="Hydrocera",
        head="Befouled crown",neck="Loricate torque +1",ear1="",ear2="",
        body="Jhakri robe +2",hands="Merlinic dastanas",ring1="Globidonta ring",ring2="Sheltered Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Merlinic crackows"}

	sets.idle.Refresh = {main="Bolelabunga",sub="Legion scutum",ammo="Staunch tathlum",
        head="Befouled crown",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Vocane ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Mallquis clogs +2"}    
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Twilight Torque",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Twilight Torque",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Crier's gaiters"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged.Acc = {}

	sets.engaged.STP = {}

	sets.engaged.PDT = {}



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
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == "Blue Magic" then
		gear.default.obi_waist = "Salire Belt"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
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
