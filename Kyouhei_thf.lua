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
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Att', 'Acc', 'TH', 'THKraken', 'Shield')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'PDT')
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
    --sets.precast.FC = {main=gear.FastcastStaff,ammo="Incantor Stone",
      --  head="Nahtirah Hat",neck="Orison Locket",ear1="Etiolation Earring",ear2="Loquacious Earring",
        --body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
        --back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
        
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
    
    
    -- JA Sets

    -- Default set for any weaponskill that isn't any more specifically defined
   -- gear.default.weaponskill_neck = "Asperity Necklace"
    --gear.default.weaponskill_waist = ""
    sets.precast.JA['Provoke'] = {neck= "Twilight torque"}

	sets.precast.JA['Mighty Strikes'] = {hands="Warrior's mufflers +2"}

	sets.precast.JA['Berserk'] = {body="Pummeler's Lorica +1",feet="Agoge Calligae"}

	--WS Sets

	sets.precast.WS['Evisceration'] = {
		head=gear.herculeanHelm_Crit,neck="Fotia gorget",ear1="Brutal earring",ear2="Sherida earring",
        body="Meghanada cuirie +1",hands="Adhemar wristbands",ring1="Begrudging ring",ring2="Apate Ring",
        back="Toutatis's cape",waist="Fotia Belt",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}

	sets.precast.WS['Mandalic Stab'] = {
		head=gear.herculeanHelm_TA,neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida earring",
        body="Meghanada cuirie +1",hands="Meghanada gloves +1",ring1="Ramuh ring",ring2="Apate Ring",
        back="Toutatis's cape",waist="Fotia Belt",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}

	sets.precast.WS['Rudra\'s Storm'] = {
		head=gear.herculeanHelm_WSD,neck="Caro necklace",ear1="Ishvara earring",ear2="Sherida earring",
        body="Meghanada cuirie +1",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Apate Ring",
        back="Toutatis's cape",waist="Fotia Belt",legs=gear.herculeanTrousers_WSD,feet=gear.herculeanBoots_WSD}
		
	sets.precast.WS['Shark Bite'] = {
		head=gear.herculeanHelm_TA,neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida earring",
        body="Meghanada cuirie +1",hands="Meghanada gloves +1",ring1="Ramuh ring",ring2="Apate Ring",
        back="Toutatis's cape",waist="Fotia Belt",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	sets.precast.WS['Aeolian Edge'] = {
		head="Thaumas hat",neck="Fotia gorget",ear1="Ishvara earring",ear2="Strophadic earring",
        body="Tessera saio",hands="Pursuer's cuffs",ring1="Ramuh ring",ring2="Apate Ring",
        back="Toutatis's cape",waist="Fotia Belt",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}

	sets.precast.WS.Rudra = sets.precast.WS['Rudra\'s Storm']
    

    -- Midcast Sets
    
    --sets.midcast.FastRecast = {
     --   head="Nahtirah Hat",ear2="Loquacious Earring",
      --  body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
      --  back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
    -- Cure sets
  --  gear.default.obi_waist = "Goading Belt"
  --  gear.default.obi_back = "Mending Cape"

   
   -- sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
    --    head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
    --    body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
    --    back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

   
   
   
   
    -- 110 total Enhancing Magic Skill; caps even without Light Arts
   -- sets.midcast['Enhancing Magic'] = {main="Beneficus",sub="Genbu's Shield",
    --    head="Umuthi Hat",neck="Colossus's Torque",
     --   body="Manasa Chasuble",hands="Dynasty Mitts",
      --  back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}









    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    --sets.resting = {main=gear.Staff.HMP, 
      --  body="Gendewitha Bliaut",hands="Serpentes Cuffs",
        --waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		head="Meghanada visor +2",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands="Umuthi gloves",ring1="Dark Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Jute boots +1"}

    sets.idle.PDT = {
		head="Meghanada visor",neck="Loricate torque +1",ear1="Thureous earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +1",hands="Meghanada gloves +1",ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Meghanada chausses",feet="Jute boots +1"}
		    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Twilight Torque",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Twilight Torque",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Jute boots +1"}

   -- sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged.Att = {
		head=gear.herculeanHelm_TA,neck="Asperity necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Adhemar jacket",hands="Adhemar wristbands",ring1="Epona's ring",ring2="Petrov Ring",
        back="Toutatis's cape",waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	sets.engaged.Acc = {
		head=gear.herculeanHelm_Crit,neck="Combatant's torque",ear1="Zennaroi earring",ear2="Telos earring",
        body="Meghanada cuirie +1",hands="Adhemar wristbands",ring1="Cacoethic ring +1",ring2="Cacoethic ring",
        back="Toutatis's cape",waist="Dynamic belt +1",legs=gear.herculeanTrousers_Crit,feet="Meghanada jambeaux +1"}

	sets.engaged.TH = {
		head="Dampening tam",neck="Lissome necklace",ear1="Suppanomimi",ear2="Sherida Earring",
        body="Adhemar jacket +1",hands="Plunderer's armlets +1",ring1="Epona's ring",ring2="Petrov Ring",
        back="Toutatis's cape",waist="Windbuffet belt +1",legs="Samnuha tights",feet="Skulker's poulaines +1"}

	sets.engaged.THKraken = {
		head=gear.herculeanHelm_Crit,neck="Combatant's torque",ear1="Suppanomimi",ear2="Zennaroi earring",
        body="Meghanada cuirie +1",hands="Plunderer's armlets +1",ring1="Cacoethic ring +1",ring2="Rajas Ring",
        back="Toutatis's cape",waist="Goading belt",legs=gear.herculeanTrousers_Crit,feet="Skulker's poulaines"}

	sets.engaged.Shield = {
		head=gear.herculeanHelm_TA,neck="Lissome necklace",ear1="Telos earring",ear2="Brutal Earring",
        body="Adhemar jacket",hands="Adhemar wristbands",ring1="Cacoethic ring +1",ring2="Rajas Ring",
        back="Toutatis's cape",waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}




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
    set_macro_page(1, 4)
end
